import psutil

def get_ports_in_use():
    connections = psutil.net_connections(kind='inet')
    ports_in_use = set(conn.laddr.port for conn in connections)
    return ports_in_use

def close_all_ports():
    ports_in_use = get_ports_in_use()

    for port in ports_in_use:
        close_port(port)

def close_port(port):
    for conn in psutil.net_connections(kind='inet'):
        if conn.laddr.port == port:
            try:
                process = psutil.Process(conn.pid)
                process.terminate()
                print(f"Processo com PID {conn.pid} na porta {port} encerrado.")
            except psutil.NoSuchProcess:
                print(f"Erro: Processo com PID {conn.pid} não encontrado.")
            except psutil.AccessDenied:
                print(f"Erro: Acesso negado para encerrar o processo com PID {conn.pid}.")

if __name__ == "__main__":
    while True:
        close_all_ports()

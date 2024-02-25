import pygame
import random

pygame.init()

class Nave:
    def __init__(self):
        self.posicao = pygame.Rect(400, 300, 150, 150)
        self.spryte_parada = pygame.transform.scale(pygame.image.load("image/NaveParada.png"), (150, 150))
        self.spryte_voando = pygame.transform.scale(pygame.image.load("image/NaveVoando.png"), (150, 150))
        self.Voando = False
        self.disparando = False
        self.disparoClock = 0

    def desenha(self, janela):
        if self.Voando:
            janela.blit(self.spryte_voando, self.posicao)
            self.Voando = False
        else:
            janela.blit(self.spryte_parada, self.posicao)
            
    def move(self, dx, dy):
        self.posicao.move_ip(dx, dy)
        self.Voando = True

    def disparar(self):
        if self.disparando and self.disparoClock < 10:
            self.desenhar_disparo(janela)
            self.disparoClock += 1
            return True
        elif self.disparoClock < 10:
            self.desenhar_disparo(janela)
            self.disparoClock += 1
            return True
        if self.disparando:
            self.disparando = False
            self.disparoClock = 0
        self.disparando = True
        self.disparoClock = 0

    def desenhar_disparo(self, janela):
        imagem = pygame.transform.scale(pygame.image.load("image/inicioDisparo.png"), (100, 100))
        posicao = self.posicao.move(50 if self.disparoClock < 10 else 160, 104)
        janela.blit(imagem, posicao)


class Rocha:
    def __init__(self):
        self.posicao = pygame.Rect(0, 0, 150, 150)
        self.spryte = pygame.image.load("image/Rocha.png")
        self.proximo = None
        self.destruindo = False
        self.frame_destruindo = 1

    def spawn(self, janela):
        self.posicao = pygame.Rect(random.randint(0, 1200), -150, 150, 150)
        janela.blit(self.spryte, self.posicao.topleft)

    def desenhar(self, janela):
        if not self.destruindo:
            self.posicao.move_ip(0, 1)
            if self.posicao.top > 900:
                return False
            else:
                janela.blit(self.spryte, self.posicao.topleft)
                return True

        # Explosão da Rocha
        if self.frame_destruindo <= 16:
            num_explosao = self.frame_destruindo // 4 + 1
            img_explosao = pygame.transform.scale(pygame.image.load(f"image/RochaExplosion{num_explosao}.png"), (150, 150))
            janela.blit(img_explosao, self.posicao.topleft)
            self.frame_destruindo += 1
            return True
        else:
            return False

class ListaRochas:
    def __init__(self):
        self.rochas = []
        self.time = 0

    def gerarRocha(self, janela):
        if self.time == 20:
            rocha = Rocha()
            rocha.spawn(janela)
            self.rochas.append(rocha)
            self.time = 0
        else:
            self.time += 1

    def removerRochas(self):
        self.rochas = [rocha for rocha in self.rochas if rocha.desenhar(janela)]

# Configurações da janela e do jogo
janela = pygame.display.set_mode((1200, 900))
pygame.display.set_caption("Jogo da Nave")
clock = pygame.time.Clock()

# Instâncias do jogo
nave = Nave()
rochas = ListaRochas()

running = True

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            print("Fechando o jogo...")
            running = False

    janela.fill((0, 0, 0))

    # Atualizações do jogo
    nave.desenha(janela)
    rochas.gerarRocha(janela)
    rochas.removerRochas()

    # Atualizações de tela e entrada
    pygame.display.update()
    comandos = pygame.key.get_pressed()
    if comandos[pygame.K_UP]:
        nave.move(0, -3)
    if comandos[pygame.K_DOWN]:
        nave.move(0, 3)
    if comandos[pygame.K_LEFT]:
        nave.move(-4, 0)
    if comandos[pygame.K_RIGHT]:
        nave.move(4, 0)
    if comandos[pygame.K_p]:
        for rocha in rochas.rochas:
            rocha.destruindo = True
    if comandos[pygame.K_SPACE]:
        nave.disparar()

    clock.tick(60)

pygame.quit()

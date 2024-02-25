import cv2

# Carrega o classificador para detecção de rosto e olhos
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_eye.xml')

# Inicializa a câmera
cap = cv2.VideoCapture(0)  # 0 representa a câmera padrão, você pode ajustar o número se tiver várias câmeras

while True:
    ret, frame = cap.read()  # Lê um quadro da câmera

    # Converte a imagem para escala de cinza
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detecta rosto na imagem
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5, minSize=(30, 30))

    for (x, y, w, h) in faces:
        # Desenha um retângulo ao redor do rosto
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

        # Região de interesse (ROI) do rosto
        roi_gray = gray[y:y + h, x:x + w]
        roi_color = frame[y:y + h, x:x + w]

        # Detecta olhos na ROI do rosto
        eyes = eye_cascade.detectMultiScale(roi_gray)
        for (ex, ey, ew, eh) in eyes:
            # Desenha um círculo nos olhos
            cv2.circle(roi_color, (ex + ew // 2, ey + eh // 2), 20, (0, 0, 255), -1)

    cv2.imshow("Detecção de Rostos", frame)  # Exibe a imagem com os olhos destacados

    if cv2.waitKey(1) & 0xFF == 27:  # Pressione a tecla Esc para sair
        break

cap.release()  # Libera a câmera
cv2.destroyAllWindows()  # Fecha a janela

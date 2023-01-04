package view;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

public class Pergunta extends JFrame {

	private JPanel contentPane;

	/**
	 * Create the frame.
	 */
	public Pergunta() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 555, 415);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton opcao4 = new JButton("Opção 4");
		opcao4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handlePergunta(4);
			}
		});
		opcao4.setBounds(309, 207, 134, 113);
		contentPane.add(opcao4);
		
		JButton opcao3 = new JButton("Opção 3");
		opcao3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handlePergunta(3);
			}
		});
		opcao3.setBounds(91, 207, 134, 113);
		contentPane.add(opcao3);
		
		JButton opcao2 = new JButton("Opção 2");
		opcao2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handlePergunta(2);
			}
		});
		opcao2.setBounds(309, 83, 134, 113);
		contentPane.add(opcao2);
		
		JButton opcao1 = new JButton("Opção 1");
		opcao1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handlePergunta(1);
			}
		});
		opcao1.setBounds(91, 83, 134, 113);
		contentPane.add(opcao1);
		
		JLabel pergunta = new JLabel("Qual Região do Brasil você mais gosta ??");
		pergunta.setHorizontalAlignment(SwingConstants.CENTER);
		pergunta.setFont(new Font("Tahoma", Font.BOLD, 15));
		pergunta.setForeground(new Color(255, 255, 255));
		pergunta.setBounds(0, 29, 539, 43);
		contentPane.add(pergunta);
		
		JLabel backgroundImage = new JLabel("");
		backgroundImage.setIcon(new ImageIcon(Pergunta.class.getResource("/icons/backgroundImage.jpg")));
		backgroundImage.setBounds(0, 0, 539, 376);
		contentPane.add(backgroundImage);
	}
	
	private void handlePergunta(int opcao) {
		System.out.println("opcao -> "+opcao);
		this.redirecionaTelaFinal();
	}
	
	private void redirecionaTelaFinal() {
		dispose();
		Resultado resultado = new Resultado("Tela vindo das perguntas");
		resultado.setVisible(true);
		resultado.setLocationRelativeTo(null);
	}

}

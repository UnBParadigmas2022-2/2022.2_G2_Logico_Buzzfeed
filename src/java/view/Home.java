package java.view;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Home extends JFrame {

	private JPanel contentPane;

	/**
	 * Create the frame.
	 */
	public Home() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 555, 415);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 255, 255));
		contentPane.setForeground(new Color(0, 0, 0));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel tituloBuzzfeed = new JLabel("BuzzFeed");
		tituloBuzzfeed.setHorizontalAlignment(SwingConstants.CENTER);
		tituloBuzzfeed.setForeground(new Color(255, 255, 255));
		tituloBuzzfeed.setFont(new Font("Tahoma", Font.BOLD, 45));
		tituloBuzzfeed.setBounds(0, 140, 539, 79);
		contentPane.add(tituloBuzzfeed);

		JLabel botaoStart = new JLabel("");
		botaoStart.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				Pergunta pergunta = new Pergunta();
				dispose();
				pergunta.setVisible(true);
				pergunta.setLocationRelativeTo(null);
			}
		});
		botaoStart.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		botaoStart.setHorizontalAlignment(SwingConstants.CENTER);
		botaoStart.setIcon(new ImageIcon(Home.class.getResource("src/assets/rightArrow.png")));
		botaoStart.setBounds(251, 215, 41, 44);
		contentPane.add(botaoStart);

		JLabel background = new JLabel("");
		background.setIcon(new ImageIcon(Home.class.getResource("src/assets/backgroundImage.jpg")));
		background.setForeground(new Color(255, 255, 255));
		background.setHorizontalAlignment(SwingConstants.CENTER);
		background.setFont(new Font("Tahoma", Font.BOLD, 40));
		background.setBounds(0, 0, 539, 376);
		contentPane.add(background);
	}
}

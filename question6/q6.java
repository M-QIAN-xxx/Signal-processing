public class q6{
  public static void main(String[] arg){

  }

  public double[] filter(double[] signal, double[] a, double[] b) {

          double[] in = new double[a.length];
          double[] out = new double[b.length-1];

          double[] outData = new double[signal.length];

          for (int i = 0; i < signal.length; i++) {

              System.arraycopy(in, 0, in, 1, in.length - 1);
              in[0] = signal[i];

              //calculate y based on a and b coefficients
              //and in and out.
              float y = 0;
              for(int j = 0 ; j < a.length ; j++){
                  y += a[j] * in[j];

              }

              for(int j = 0;j < b.length-1;j++){
                  y -= b[j+1] * out[j];
              }

              //shift the out array
              System.arraycopy(out, 0, out, 1, out.length - 1);
              out[0] = y;

              outData[i] = y;


          }
          return outData;
      }


}

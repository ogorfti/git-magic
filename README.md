
<h1>Git Magic</h1>
<p>An intelligent Git commit assistant that saves time and effort when staging and pushing files. With just one simple
	command, provide a commit message, and the script will automatically stage and push the changes.</p>
 
<h2>Installation</h2>
<p>To use Git Magic, follow these steps:</p>
<ol>
	<li>Clone the Git Magic repository from GitHub:</li>
	<pre><code>git clone https://github.com/your-username/git-magic.git</code></pre>
	<li>Navigate to the cloned repository:</li>
	<pre><code>cd git-magic</code></pre>
	<li>Make the script executable:</li>
	<pre><code>chmod +x autopush.sh</code></pre>
	<li>Move the script to the bin directory:</li>
	<pre><code>mv autopush.sh $HOME/bin/</code></pre>
	<li>Add the directory to your PATH:</li>
	<pre><code>export PATH="$HOME/bin:$PATH"</code></pre>
	<li>Reload your shell configuration:</li>
	<pre><code>source ~/.bashrc</code></pre>
</ol>

<h2>Usage</h2>

<p>Run the script:</p>
<pre><code>autopush.sh 'Your commit message' [file1] [file2] ...</code></pre>
<p><strong>Note:</strong></p>
Use "." to commit all files in the current directory.

namespace ThomyKay.Jira
{
  using System;
  using System.Collections.Generic;
  using System.Text;

  /// <summary>
  /// Holds a list of sessions.
  /// </summary>
  public class JiraSessionManager
  {
    private List<JiraSession> sessions = new List<JiraSession>();
    private JiraSession currentSession;

    /// <summary>
    /// Gets or sets the sessions.
    /// </summary>
    /// <value>The sessions.</value>
    public List<JiraSession> Sessions
    {
      get { return sessions; }
    }

    /// <summary>
    /// Gets or sets the current session.
    /// </summary>
    /// <value>The current session.</value>
    public JiraSession CurrentSession
    {
      get
      {
        return currentSession;
      }
      set
      {
        currentSession = value;
      }
    }

    public JiraSession Enter(JiraSession session)
    {
      if (!this.Sessions.Contains(session))
      {
        this.Sessions.Add(session);
      }

      this.CurrentSession = session;

      return session;
    }

    public void Remove(JiraSession session)
    {
      if (this.Sessions.Contains(session))
      {
        this.Sessions.Remove(session);
      }

      if (this.CurrentSession == session)
      {
        this.CurrentSession = null;
      }
    }
  }
}

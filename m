Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18A1F418F
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049326; cv=none; b=Oh9v+6xglYWqD4ZQG4fFjSzXz35uWlitAoX0DtWJS1X2YdaNV3dROHyLI66jOwHSc6Wws2Yfdexjn6UfUjsu9+r/I38Tcv1VrUPrrfbuPgpLa39Rapb36kiR8MjEcTPTlh/xDfrDbXAfGl75ESCNX1jpzJHVk0OchIX9pZEQykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049326; c=relaxed/simple;
	bh=9kKz1NuyzPTdS29gXY6YszPmo3f2jZAS7uQCXkXfigw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BUJDCy1PqQWmeZAvWjP0cO2sTW2rlWbhmXReW18ek8CXfouF5dZPxdQQezNkFMlkcmv6qKdPbjA6VDKRJnm7QKeBS5o9AnKxESrfNiEPfOGonImTMU8iVbFm+mqX19tE7gVx68iX16jj5Onpoanl7VtLnUHGjkFJkFXBl657DXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4be1dee67so29380924a34.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775049324; x=1775654124;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFlB0l8lLf5AV4rrOyWvfjH0CFiY2dvJm8xVryALAvM=;
        b=H59jMEE1NncG4e4qWL+uYMVcVoqG8q0P5WfNC+Zn1t0oc18B4EBk4oTHgA4XA5ukox
         ELOn4xqLuqRttrynsnufB1zpXlpioLoj2HtOiv85HUNhn/LEut9AOoJZPsOmqNv8n1vq
         58pSw7zS4dKB8vOxBBPgZPjNYh+iNQWtR6+G2H6PWHOCPpKZ6o/lx/6AVJbcYTm6qSDl
         ay2oVAVXeWloc3Y6kTwzQGFTaSX/J8K8VGDH3mbpGSy8mUWyYkLsl0sF+d4a7iBZoJ7n
         70pw53HRv/qpDBeXJaTuxzX+d3wh2RoSVBfiSxWSwc9CxpLsAANjhmMRBtz3WdYT3rjc
         4hNA==
X-Forwarded-Encrypted: i=1; AJvYcCVomVNvA3jYnUCPJbsULT0IasruF6U8ndFfYyRzM7aq9DwahpbvpFeo8OeWUXK17UdKGPr6lm6KPIP1zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvAcBk3697yolGlZ4GRMCP4g/xjylBGJa57lSmcPmURGkM04fM
	j6dejuyXt14KufOf/e2xk2fl7tsDOLU031pAKxsS9s1V/2OQbhaUOoMI0fkGxTICWaqmueCAeRW
	xC7DODnz4/uHLf++w+RACD4FWtcIRY6GOh5EJM3c6/SufCAg6xJvzXaqpX+g=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a08:b0:67d:f8f9:d3c1 with SMTP id
 006d021491bc7-67fabd03ee1mr1616284eaf.65.1775049324320; Wed, 01 Apr 2026
 06:15:24 -0700 (PDT)
Date: Wed, 01 Apr 2026 06:15:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cd1a6c.050a0220.70c3a.0001.GAE@google.com>
Subject: [syzbot] Monthly media report (Apr 2026)
From: syzbot <syzbot+listb55b05bd6ba228a0a478@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 8 new issues were detected and 0 were fixed.
In total, 31 issues are still open and 103 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  4938    Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<2>  814     Yes   KMSAN: uninit-value in dvbdmx_release_ts_feed
                   https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
<3>  567     Yes   WARNING in igorplugusb_probe/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=5d7eece664082e0c5c1a
<4>  221     Yes   general protection fault in su3000_i2c_transfer
                   https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
<5>  148     No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                   https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<6>  135     Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<7>  93      Yes   KMSAN: uninit-value in dvb_demux_read
                   https://syzkaller.appspot.com/bug?extid=bd7c90de4c9f1f8ab660
<8>  33      Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<9>  15      Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                   https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<10> 12      Yes   BUG: corrupted list in az6007_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

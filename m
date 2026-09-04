Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA72152E059
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788554026; cv=none; b=lnL/rvUHl0YGE9bgDCa7pK5YaarGxyPA9D6oADzXlQIP25+0ysaFc/spFv0kahnqdvbOjU0xdSqNbjXbigkXxURmsjhRSZBksHcTQLZj6cD2PChvBakj1BMz7pkoC3EK/Zw/9tEvvf3IqIj3Ig86ptYvJxGUU807ik7vg1eHZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788554026; c=relaxed/simple;
	bh=VpZoh0tveXOA7ivjswx7WHCccFQnm7X5Yux71yekqNU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cRLjPHiiqRReUmq56s6w700VdU7QJjWua1timdEGq35AM4QoA7RmYNNx2C+ScWo38NM0TksrwSV7nnQYx4G+GtqZRj1aEHDYSNs4GQNr+V1LHSfTcw1a6cL0IgL5r25/nxq/YmsFk3ADYDtt/ryf+iRZ6eXw60WdWXZtp1Wv3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d9952a5so2119812b6e.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788554019; x=1789158819;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JAXrDAp9YbJF1jM4BqtTbRQ3IKDzyU1LF5OsuCVK0g=;
        b=kIPSYWxauzWtAk8xw9YGNJSAz9e2N1ITzDGAmjlLnGotORt3mpGxuCYxJOirW8V61K
         /ZXCXYqqRwWz1r8O0CodZrbhqAjd0koaqxacl4/pjxHwPCrKriyLkGX7XmMVkxslbNe8
         YfnlSFuk+fAfhob63JE5AKhUmKVi+082ZvrjvPHaar9IdgGM8B9vr1WIBxVHRzJPfYo7
         +UHvu9HmSkvV8bfRR6nCHOuHT1s0UJ61n2d9Rfl35vEN6uygI1yeTYtcBlSaLZrfjnMk
         hcmMlb+BN+RZfB6zpdPp1twozvyjH+8NABjSEJPN6EY3aiHOWHSsINRyzna66VOqgYNm
         YiDA==
X-Forwarded-Encrypted: i=1; AKwUvBxtxOpwjrjz1oHG3JPoqVa7+0BG0608np0vUGfvTyYP+1spfDuaDzUKRM/I0efkJ90UG9MD/eBt8bYOWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kg09q/Xp7TzWwOpeTf1ks/SNha2POsDbzPw6817uyImHRX6Jvc
	kZidzQ3FTIYVAKSusjYcKOgDv/RJeue1BctcyBfTdEjXDSLKrCqA9yVKT9sI8clqIusm2VHC4Nd
	AAM08pTgrrKBUqAR5whjbe5u2t/NjtjeLPQPyggFG6mtAqjFQCL4vH7qaREg=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f034:b0:6b7:46fc:1ce with SMTP id
 006d021491bc7-6b746fc039amr4410045eaf.45.1788554019750; Fri, 04 Sep 2026
 13:33:39 -0700 (PDT)
Date: Fri, 04 Sep 2026 13:33:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b2b23.b5d4176b.238c3e.0007.GAE@google.com>
Subject: [syzbot] Monthly media report (Sep 2026)
From: syzbot <syzbot+list6bbccb1b8e29471d8c2f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 13 new issues were detected and 0 were fixed.
In total, 47 issues are still open and 119 have already been fixed.
There are also 14 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  295     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<2>  165     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
<3>  79      Yes   KASAN: slab-use-after-free Read in rc_dev_uevent
                   https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
<4>  21      Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                   https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<5>  14      Yes   KASAN: slab-use-after-free Write in dvb_device_put
                   https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16
<6>  13      No    general protection fault in subdev_open
                   https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
<7>  12      Yes   BUG: corrupted list in az6007_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
<8>  3       No    WARNING in vidtv_start_feed
                   https://syzkaller.appspot.com/bug?extid=525fda837bd5fc2be560
<9>  2       Yes   WARNING in ttusb_dec_start_feed
                   https://syzkaller.appspot.com/bug?extid=e1dbaae5eefaa2dfbc35
<10> 2       Yes   WARNING in v4l2_ctrl_cluster
                   https://syzkaller.appspot.com/bug?extid=2d417475ba9d6d02cfc9

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA835E1C1
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888039; cv=none; b=SngsOlzD5WAQ+ZkhacunjzumpJ74/zxY1fPf2uckdint9qxN3qkAVzQEDFDOZHtTfGIjtupLBPcpf4oxf/L/VddVV3voWGYwMi6FJbyeaXejIKaVA21nB8xoPS+VhwTE88kbVlHQC/WxFyhTQffhTomty8Le93NpF86WVs0rAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888039; c=relaxed/simple;
	bh=VCDkASRHxBaEF31yY5SE7KnAc2ZBRF0B5a0BxMdpHHM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SfW2kxUMxH/0/uXnBuC1lgVO2DWe1auM5YnQ3hONOe187tytbsQz6THaeOQSXMH3LPnxUjh5RbDsP/Pvf2fHJJaYShceHt39Vw2DUJIXrkClshqXi9+PtKFByaeS+pg9f2Qomzzzg01HD0UivqcGcuvPyYSyhshslsqg0ZbhbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4583ab9a376so329959fac.0
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 17:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888036; x=1786492836;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAk+GSd3mYqJA4DKQeq+WKs3KEPGwk2McGxpJmfJBtg=;
        b=Cm71D50fOShEOYIgKEDRaR8xR7+JQcIZKFuQ009Kv1vHFb9CwupGvnzL7Ro9FVHBEI
         xzO0XXUvZtr6UUpy13RiRgVwSUGSLtwdrM1339R3MkEGl4kyJPs9HX1896rLTam1CVDb
         906fEZ3pCix3JV3qLPgjy4QaBG7mZUredvF583HNmnZOA6rQdtJZarumLU1sfC2de+87
         lq9JQAQcytryk4rr2ZsKdasqZt92DdlXw+T+ypic79iq4AY9lfhK9yjcfnnz62e19DLe
         R0XDroTe+vAWVrPq3S5Gt+Pt8PT0GhIKQcZEBrmDeESOYlGv33MDTELVXSo29YhSKawy
         lspw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8rCL2PwsYVP5hFnEUeDNlhO0RQpag/oNYrb8Y1+RSUy7Earz2ElI90IGV+vCYnkQZSC8mLXy67hUTcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW5a0zwf1m0l3laCrd9YtbVtTQicCqhnGzgjUEO8h1Rj85P3wj
	h5VdsVbQSf6XHD7iSZuZDU602X/TaOlK0lBrqt3eq9sNmMW3GX4Uwk80gx8uNiLShnooDwN02Ah
	IPizmPSv3pGPoDRMfliNuwvxkFCW/8mJkgGcVYj/Ow/rZsAzTPytR+2QVT8A=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c83:b0:6a3:955b:8474 with SMTP id
 006d021491bc7-6ae96c389b7mr1803164eaf.4.1785888035997; Tue, 04 Aug 2026
 17:00:35 -0700 (PDT)
Date: Tue, 04 Aug 2026 17:00:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a727d23.40259c87.584f4.04d1.GAE@google.com>
Subject: [syzbot] Monthly media report (Aug 2026)
From: syzbot <syzbot+listdadfd7300e835664d663@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 8 new issues were detected and 0 were fixed.
In total, 30 issues are still open and 115 have already been fixed.
There are also 11 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 469     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2> 250     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                  https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<3> 20      Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                  https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<4> 12      Yes   BUG: corrupted list in az6007_i2c_xfer
                  https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
<5> 4       Yes   memory leak in vidtv_psi_short_event_desc_init
                  https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
<6> 14804   Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<7> 7       No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (5)
                  https://syzkaller.appspot.com/bug?extid=cb43e758a4dc84dd467f
<8> 5       Yes   KASAN: slab-use-after-free Read in load_firmware_cb (2)
                  https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
<9> 1       No    WARNING in az6007_i2c_xfer (3)
                  https://syzkaller.appspot.com/bug?extid=5d7ca36eaac36bd6a34e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

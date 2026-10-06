Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694C370D61
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261209; cv=none; b=OFVIiCQY9THoi61xFCGvgiEcTDtCnCrT7K6+yXO4AjRSBCT5eYZZMLk77znNMzGDOBVrG/Yp3/xvxPkBuGQiDhtm5eDvg6TnNsdQvvkG5Adf96a74u4XbP/8V0Hey3n8QBgyg6euYiUs9Nr3aFi5KPpoxsf11/bkltVoTtnBoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261209; c=relaxed/simple;
	bh=TnTce313NjcyC0JIWSJVLDaUCSSOSf4juQgSQ/hJoGc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GnZECu0HwweIooP3P4czboeNdr8x4RzyIz1mA3oSjH29zxe8oIAENGbP7XilL6uNT48aE6HAZ+3Vit9FSnN8938ym219pCynaQJUsu0G8oq2V0uk3KdCLR+IsKTKxm1DUJeuTR38n6qecWwOqrmLhrNgqvMzFwRrm+c5KOe/9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea4c979030so5090737b6e.0
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 21:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261207; x=1791866007;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWCEugY1TPY1aIZTaHZc8c/vZIq+klJR9OSQcVtsQwg=;
        b=K8ymgJSLyTOoZ7iMW0EQuE0jZUKflYoat+7MgVnKwNT6RmvA17QG1lRdfIY+dO7WLY
         lfysVeDJRP2qb80w8H6RqrZNZxfAIDw1h4lywiKhFrGeHfKnSFJV1RwXgwmzZUtYS8fu
         6R7KCU+cwN3aKoAiyqVwt+0ZXOORmcoZX1n1ecKPqM+G8qgKsfqxUy56pqEqWvgsq4GH
         uLWynP4puClH1sgELhdl5cS3U5A+9MAXud1unfuND51LHEb/ee8AUYSAGKO8GMJpnTRt
         aaoP8/BoR91n4XO7JNth4UaNVPfWsposuhzfuqSKBdFj18fjs1ArGBfD1u2oXwZZ/RWr
         G62w==
X-Forwarded-Encrypted: i=1; AKwUvByrSWk9IqNAr0wV5+k5zUvBQuJpAMkTjzVRINZXhiHR1ZlESF2VuAf3cV3tNAae/h0jLPUAh3l81PRx+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++ljyQoGBea/Fx0wL7aNJpgU6kpbpd+UXZk+8o08mLstTMBhyyMl
	n/GNnAsebt3JoBgIDBIxPYKA916qsd8jswlLRNT/aFEOej6WelbwUSExo1q4uYmZXAZxul8ilzz
	lcjTkZbGnFtWtgQuMo24JIMLpOpEb0/WB84pkpfuhT+0dKbC7htUjZKpaxEU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c413:b0:4f8:4a95:994f with SMTP id
 5614622812f47-4fb4037a2d0mr353572b6e.30.1791261207400; Mon, 05 Oct 2026
 21:33:27 -0700 (PDT)
Date: Mon, 05 Oct 2026 21:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac47a17.598348e0.18b15.0009.GAE@google.com>
Subject: [syzbot] Monthly media report (Oct 2026)
From: syzbot <syzbot+list24d523540eee1c37758a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 7 new issues were detected and 0 were fixed.
In total, 49 issues are still open and 119 have already been fixed.
There are also 12 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  334     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<2>  309     Yes   WARNING in ttusb_dec_send_command
                   https://syzkaller.appspot.com/bug?extid=ac9880be0b0b1a5f54d6
<3>  193     Yes   KASAN: slab-use-after-free Read in rc_dev_uevent
                   https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
<4>  117     Yes   INFO: trying to register non-static key in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
<5>  84      Yes   INFO: trying to register non-static key in as102_stream_ctrl
                   https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
<6>  27      Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                   https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<7>  18      Yes   WARNING in ttusb_start_feed/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=3caf6a60e5f9be12de08
<8>  3       Yes   memory leak in dvb_register_device
                   https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
<9>  17200   Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<10> 30      Yes   KASAN: slab-out-of-bounds Read in ec168_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=64485d3659c4c07111b4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370263;
	b=yFM3u9unBOUY3s8iDf0WNjc/2ImbVG0XY+Bi0duyXAbd82C3J/FxHbe4lUzmOFTqKltm
	 X1qoIu91jE9UpkPT6b8Hln+YTQA7Y73T6Nu89Bg0nScJYpwBAs5NQJvDFP2LDMHZ5YYK9
	 XnUPnkalx7rK+hC2ZWnm77tLrEJbIDDA5hL4UhfE1d7T6OjI7pwffXlhIK8gm7H4ub2Lt
	 KOO185gaTgc0x4aaT/IFksDvCpT0UFn58MlRDCdpU/UsRpCJHKfonVznFviF5URotfnxM
	 KLCG5GGnBc1EMc1kI/iWyXP/ItsLY8q+pkuiLqDDVnNbMK0kVEHwCBB+TsDS8oCfPfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370263;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=vBoHYFy/cTUCjfOtJFMPMFMPiX8gIH2AR8PWXIpQqbc=;
	b=KviNOenfyjz6kah3495M9LSkgo5hkGWk4nGSjvYHP+2rusxmnv4+CMHbAgCi7oklVRy0
	 VInetXdVhwO3k88lpJKhGQ7jQFEdmS/7/7Bqe+5NeOVZbTc+FcPLBx1m7hXP+SubqZsyh
	 y8PEDqvEnufJJN00lBtAWyvYl5TRW7i7vsW4J81B9LdcZJgN441WcbYC94eRVV0vgWO1+
	 REKh5ycCL8XlWhAqYU+YQzRe/bOJz2veLLWTa0XAwe84uq2i2wtDuTwpIgAghDTu2AuI/
	 xNX/323V1gC8l4zcaM6DZ1azYR4xuVH4v4nPtT/cNZDm5qeE61qanRkN1QkaMVUWqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F96606A336
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 04:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F96606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4adae31e4b1so3370597fac.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 20:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370262; x=1794975062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vBoHYFy/cTUCjfOtJFMPMFMPiX8gIH2AR8PWXIpQqbc=;
        b=L5EpJqVxLYbbuJyV7wRjobIGntZVq+rfIDlaracejGU8SNGnR8bqP8pOhRpLJ1py90
         qxvOPz4DQ7QMGRPERfo9impAnuXuzfulNsuDF2Eo/smBZxfLSpwv03oVKclegRERu7eW
         xcwt9mFJ6YiRDg+b+MwyTvsyoOMw9Fu/K6Te2vnArjHcAFraZrRI80x48sLeCyVpkLsh
         4jvnIVUjZyIyY/Z/aGhqPX65Dy15UVtDbNS/liqgDoYRSe9QEZ1dk+2Qfw079k+ytk4b
         YUd6PVYaamod90QI7jsfVsGOyUQD4H8SAy9Ogy7vKq9siXmLFqVZ9jmutF4YC88PMNhI
         0tDA==
X-Forwarded-Encrypted: i=1; AL+hErFijQzu6Yph/SwcVIZMlcUwCNQVED7trL9jzH6yathzzan0WhXSso985bLCPt2TfuAfHDRGierwrQXitw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zYvif6bdockneAsdf4x3CfxD/DxlcIZ/Xn7WpEO/2PAhPSheT
	np1IH5kstOWukp0rzMMmwCpV0lzYac8hiZ8X0tZ0/Itsy6S+yMEe6QOAMfn5UZPZSBm0RM9hN50
	YqwGnFlFKJ59usj1TAUtL/hFaJWnkvZ9JywWoWd9624mzxaCEbhGojGjv9UQ=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1b8:b0:55c:836:5955 with SMTP id
 5614622812f47-56b966af254mr990206b6e.44.1794370262171; Tue, 10 Nov 2026
 20:11:02 -0800 (PST)
Date: Tue, 10 Nov 2026 20:11:02 -0800
In-Reply-To: <179435860052.4109564.9298992817657762327@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3ead6.a9443767.1fe41e.002e.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] general protection fault in dvb_usbv2_generic_write
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: immersa.bartosz.chronowski@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, media-ci@linuxtv.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Tested-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com

Tested on:

commit:         c03c1a14 Linux 7.3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=112d05a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bc22e3bf9a6ffd73
dashboard link: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1030544d580000

Note: testing is done by a robot and is best-effort only.

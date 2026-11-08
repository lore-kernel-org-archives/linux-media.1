Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161763;
	b=q3vxgqQAbY+kmBYKIjWBFE7jixIaLu0bmirR+tQmhpdnDbAq1NGvVe5COpaIBfqSXAT3
	 ym33zyiS3u24F9xTJmrAHJVsqtypLs+5QK92yQ5MCrETP0ISH92TKtmFz276tCHZeeIjq
	 xUpxCS7ycSP0egUS684BNPdGVpeN/LLq4b3aaWvEGOGOvszuJ0g4YbasyURWYzXljw/Ki
	 6sbFzT2pQ1CZjLRjl+y9dd5faVHBUMli4hlEPTP5+/X58QidR8DWJ+F93rV1cwYw7ItV6
	 jLyeox5o9/dDiEHlcSt5M4qlAw0dUxq9n+vhtFyLaLpPmKcbRQ62NNUqMIqNtVIINoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
	b=w7OkxbgWazcpAjJwh1hzUrKSfgZPX8y1eHBPJ2IroJ5tYiJyO/i9M9a+jylM9Kpm6erm
	 jmK8Q9Kp4oTrUBPpgMzzvzKoHH8PzHVwxHlCKsv/iQRA37naWNGOQGxsWWovzWa8DAmYR
	 j2J4whXXznoi8zC9I5vhR7BWB17xFUETbBhMHg8kahsjZnaVS/604l8X5bnun8wy8gH/a
	 HP5YRJIs/HHvNZ+a49TgA9UR6SLqq88yMRVawkt6uj0NwTJBUz7YMjbT90ajy+owlZyOg
	 O3DPp55Cr5ROR+W/9XoZZqT7eC8JI97OBw/n1B6sQgRstDYemk5awtoAvp4lcyd0zBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6B606A320
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A6B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-83edc5c5ae9so95208a34.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161761; x=1794766561;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
        b=Rp0RDEY8YlQj9t+yk9TyVtrddVocAwzEp/NqAWU/TX/Rz95h78DkccdVqf5/AYGWJT
         GDf2l8P7t/xHT+uf7jGFyNHylRKs4rLWZ5Da30JrPU10YZucIkqocILrpcBPfkibIWYO
         HrTuuQvTBBOYyGsO8/oUnuVnVc+ynJfz+OPXwPPlj2S5izBD8WFZhAcm/Hbx965sNtcp
         K2rZTCzIQDehYjVjkbKX6LWx47kvInIY8sN2IMW0R6nIDWXYod631vrJHEG3LntfMu82
         yUpqvXD+boybfFwPNtUkoIyYcrRUWryJohYbashC4ksWOIU9jFmVC3qOs9cFhf9jnmgC
         VcDA==
X-Forwarded-Encrypted: i=1; AL+hErFPJWxTM7dR1MSOEVwDSanD0rQSiVqG/FWukZGE8Wr3Oje8gYFup7Qr5PE41aT3MS5GDEP2hAUH2+q5/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tHLQGNW1iXsBqEDq4e/7K/Cw+49LOA6ivUTlNnuy/jUDlkLlV
	Em6RvVS3FS8opkxYLbnAJ0UiZC17EjlIM/43nqti24mh26mEfQrOnQCk5oVsahF+eK2OFIg07Tq
	MNNE6qiVJMxEQH4gfGO15Wywgla7j5s9802ALTobteAEfT9HDCnkVP4WurQ4=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c7:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-568147212e5mr1152091b6e.53.1794161761733; Sun, 08 Nov 2026
 10:16:01 -0800 (PST)
Date: Sun, 08 Nov 2026 10:16:01 -0800
In-Reply-To: <6a56fb92.c90005c7.37d349.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0bc61.5a668245.1aceb6.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] INFO: trying to register non-static key
 in __vb2_queue_cancel
From: syzbot <syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com>
To: gautambhadori9@gmail.com, hokage.newbie@gmail.com, 
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab+huawei@kernel.org, mchehab@kernel.org, 
	michail.tatas@gmail.com, pimyn@google.com, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 288254383674be25b26cf137bc12bfe38fefbad6
Author: Hans Verkuil <hverkuil+cisco@kernel.org>
Date:   Tue May 19 10:07:59 2026 +0000

    media: em28xx: use v4l2_device release callback

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11227f8d580000
start commit:   f909e534f5e3 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13227f8d580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15227f8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170e74e1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c43da9580000

Reported-by: syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

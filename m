Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910825;
	b=pqXA+NbVAImq7zTjJRFErkrGulGL2e9lKXKND3ePHBEUSVFBosnJV1wgUkt/7SLPR1af
	 UzbP8gp9y8ce+4Z2H4dxOgBQOLK+Dg3ahxuLmLWGZ+biw5xQ/L61tjbg/UHENeKxrpVco
	 eryVvpf55a0Z0SyFNSX3I7y0SUJnV7dc6Pb6wOcBko4ItRSojuU9nFVssysJt90p4AIzQ
	 pB3rVm2I/ioYx3/KVSebEcH+t2yVEvv1+cFljbUj4u1jDZ9B+g3zuK3KVyfhd2wbUYYoK
	 GXvdGQpG5ZtX2vtLcfBrU3lduzWldwt1OyCghzBM+wn1yfdZbxBfuW5WmfwsMA+l/Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910825;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
	b=MwJA1QNtW66mbfvnpAUbzWMuL2ZZ9ssxkNuUnKXx/x5z6o0jbMXxsksiVi464Om51lVm
	 e4Z5gjgBWNjg/PMhTpP6m7IVO+i1vo8pRb8eX0FdmvatuFM8+FEuv+NKdFGqlRevf9HIP
	 4Irqn5Lbf5L35HrPEVm+emwfssFtohITrus+HF5tuVTO6+JWPLvdZcIeCnMDUDGwHmsQ8
	 Q5UG12IYfNDDNdFsKIUpDDv6H528XoPlPYrSxs5Xh1+EpQ9VbxPkiSglcbvWbJWJ3p1ww
	 zbePr7cABl8ENYuekRlxZN1fpE79GCT7Ag+dVKh4EtJSmNaJKqmouEOtWwg/RaMmvpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAC606A32D
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so2863407b6e.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910824; x=1794515624;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
        b=bcUUTt96CVcq37mjSgBK7YAYMuNr41+NkuCYQMlmkkw5CNiWMN6kKgd1oJWyWPePi4
         N1MEOXLIwgRrg9ic9UBOYFKFGEhi25BdSld7xbaVValOj4t+EZ8eOtGb7AmJTfv8HmwZ
         Q8S19HV++DN0uZe5fJnCTZEYWq83rP6ZQxZOODIBegT4wbfp0v5P/505kFXuWxCUqzfY
         C/i7Q1y6ZeMWA4KS5u3fJqVfeB19CHRwPOceSIjUfgs8Z9Df3mtnvc65XaBrLCKfnn+m
         ZI6P8EO4o3rprREbKlVHFx/tTZy6c0Xnde77ESnHHZTbzTEdnZPl0oiILFfQnoY4SIWy
         QS9w==
X-Forwarded-Encrypted: i=1; AKwUvBwvN5zeTodFslanpTDoYr6tnMCzRXieyP+74EFg6YBC5WKKjgsDRkzlI0DLdhiLezyN//Ii4kZL9zRCwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z81E9PQ9xFobIJfdbxQpfq5zfhUl0C4SIzqYWl8MV8MCohQk5hs
	c2ZlwWTWQ2jbHyQEheTSpfUBNB+toB17vzodofD8bAOHA0+esTktyybzB4Kk4p4ZYh8n0Pb4ZFe
	BPrpc9GYy6buRqDmkAIVYcgaGgb0UN3C6fmK5uW0/PzUlLBVuJK1J6Aqg7Qk=
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f61:b0:4c4:a240:9c3a with SMTP id
 5614622812f47-567e0993ebcmr356219b6e.4.1793910824203; Thu, 05 Nov 2026
 12:33:44 -0800 (PST)
Date: Thu, 05 Nov 2026 12:33:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aece828.ae8774f5.3905c1.0000.GAE@google.com>
Subject: [syzbot] Monthly greybus report (Nov 2026)
From: syzbot <syzbot+list4050b078885043dc999b@syzkaller.appspotmail.com>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello greybus maintainers/developers,

This is a 31-day syzbot report for the greybus subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/greybus

During the period, 3 new issues were detected and 0 were fixed.
In total, 4 issues are still open.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 233     Yes   KASAN: slab-out-of-bounds Write in gb_operation_message_alloc
                  https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
<2> 119     Yes   WARNING: ODEBUG bug in gb_operation_put
                  https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
<3> 40      Yes   WARNING: ODEBUG bug in gb_operation_sync_timeout
                  https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

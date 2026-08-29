Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236E3C09E0
	for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018981; cv=none; b=t57/p4Ro4KwwAm284fuM1/E8KVwIfrYli/3QyrXgdc4qdZlhx+bXBg0G2w/XNQeeIXXswqZfzKUXxVsG3QFlJU+iIQq0y5HF5J0NRGQH5Z6PTXSdbF5JZSzIErRhAD0MXbuZoM8Z4/VDgw1GTX/jXiAMl+DVY0yLCPPX0ytEh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018981; c=relaxed/simple;
	bh=IFKHfgVFc1rWdGFd6rVv2M1jw45BBFJD2+4hD2V0JLY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CZqHGeOeOwssqmp2CvRYxVrQwzkSkuBPQHRWQRnbVyGWJUyYdVGoQh2A16POtLfwUC7Z/54F/VTCgVlmLTHP0vbuvO/yaxirZiSpzg+64JBYrYqZqf4J8LF4JtwzPeEKLTSiiA5OuXeh4DXxCTFbSDtovIlx7Rp1aplElJk5r9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b1bc2e44e0so3670528b6e.0
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 08:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018962; x=1788623762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WXXv4xpnt1/RIHcZ+q2gQWeRw9AsLgQNjGhPdDBrae8=;
        b=nTGM4sG+EhlwjOMfKxwQDfQozC+tmW4Q1cef/Rla3UnoDRIoqOLXxZcB6vg3Z8v03j
         TnQiUbkM5zEtHnvYPfZchV2PxpTo+Uz8vuWkkjrRGQkcPLdbzQbmypdqKo0Cbkg4iyWv
         lJ4a6GLZmCsH5VJcUycKpDCFpMBIGGxXBoxMoZJZEjFabf3KF+VfHn0I4Bfs/ubyEhjM
         riuhmxwD6lyFp4mJ2Xsgl+mnVzMgwVsqtFNhJCqn0N+iOajx3L35utyRkxTXAQ5hCw3a
         qhQ9WwkH2MgFHdCHCOfIX3v7KCc5IkC7AB5UQXxVEUBhZGqUnh8YEt8UN7bfh7Ug3EOp
         L9Jw==
X-Forwarded-Encrypted: i=1; AHgh+RrKEJYW6p+e9B3FGxeOAIfobkRQsi8FtkiWtRZ67VtBq2ytUX2Xr2jol8rRg8QsjAE8GDH808moEpa0SQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mt1zpntd6O5ao1JCo2I24yS5Pz94d8diSM0KP4ThegAx83yqaT
	erd+vmdhcOACEJBtPer8hs6iEub87kq3qGJUqiPePYAr3Cpyj4RxRH2DszhMlUVSQYVxUYzigU1
	/TQ/RuXIJZ27rxOTpIh7vF6uQkQ45QmFsYd6MsOn4SuJH6HOcyzX0XG5VKYQ=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6783:b0:496:11f1:f2ad with SMTP id
 5614622812f47-4b3980587b6mr16630161b6e.6.1788018962740; Sat, 29 Aug 2026
 08:56:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 08:56:02 -0700
In-Reply-To: <6a78d191.b50370da.49fe0.0041.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a930112.1d9ded08.62e62.010c.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] WARNING in udmabuf_create
From: syzbot <syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, robert.mader@collabora.com, 
	sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
	vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 44e9eb5a762142a4aa46c0b5da7c39bfeb78910e
Author: Robert Mader <robert.mader@collabora.com>
Date:   Wed Jul 22 11:01:45 2026 +0000

    dma-buf/udmabuf: Disable the size limit by default

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d14379580000
start commit:   0a0d1d55dad5 Merge tag 'scftorture.2026.08.18a' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14314379580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10314379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=335632b21d0ce540
dashboard link: https://syzkaller.appspot.com/bug?extid=bfeed181d1ce9ec87a8f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c2719e580000

Reported-by: syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com
Fixes: 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by default")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

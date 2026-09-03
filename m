Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A394137A8
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429666; cv=none; b=n+C+T4Ez9kTNuPLw5wtEiA/uOp0Jct9rdaP/3QNJi14wOFVZyO5UsJESJA2/NaXA2JZuhqiQ9fDirET/rj5Xo8jtCM1UZiJzKY2I4QM2NKQj6PaUw+GaKXdPr+xyQcNT6elux1MUJIHkg7jRQD/PCWOncT8MgbfePyfUQlK1T3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429666; c=relaxed/simple;
	bh=ryInLUjJI32PSk+T2NMhpSbpKFvxq0wpSaolLnU3XEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EMd+sySf2vsk3eCreXI+0Bi1Qf+OnR8eA1QgXQixuihX4kCILaJ+TEIU1f9N4LgCo35fgGkFloIuay71awH5zmeBvetwOjPEtkkXNyvRbhfIaWbnDWWbRxtaLtsokke+1xzIZh+6hUiNBkYo9TiKsa6QiNeKOeJ8wSUnfQxpAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b34c5c6de4so2074919eaf.1
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429663; x=1789034463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+izbsP1CRuSYp7hZOU5ThuvWBJhaTYyEvZXcdhmlzg=;
        b=XH2GSfuP0Vt8BxqUsJ7XhXxt4VTOj1sy4Ji+3I1jJBqfCgY5Tz/p2L5m6cip9khwdY
         rYwMwhhuKNMY1SLvx36vyU70iduL6O0EyUDKKOFvttzafyAUE2xrqPDY60CIq2Os6ujG
         ztYAnx4F24Kj5S3Rvkzxw0mEuTMs5iR3vA4PH0pqTFpSHXom6BZMm4RQZMGpt1QtrpvV
         bLBMKUO3s2hRpJMQJztyDREOgC0Z2vHzgrzgkhTxu6P7smvblGPE1uyJrTIbCJOqAfcK
         jHSWbK3BQvU5qfTsdHEYvvC9oNzoKZaYe2oSsEb0RAg4i9QEtGMIoRWbMyBMwT+GpO0A
         wibw==
X-Forwarded-Encrypted: i=1; AKwUvBwF5D3lTYGz6GJN3p4i6KdS5mC8p4dxEt04rkEoAT5Dfuvq2irQBSlERL0lTlB6D2JnCRK+5JYqYbhMhw==@vger.kernel.org
X-Gm-Message-State: AFuF++m+ILkiqe5TFXaIzahwDXWjOYUtuRSB2fVcmlBLX3WVX+CSnD43
	q3v44tqgsfaZLagZrKYNIRZhFxz3s9HCkW1NMwgwMoC6O7GutdLbAwMvDjz+xnb028ZBmpdCviG
	0uJUegILLszC21I+fSGwjy0Zckt+1fiK99vQ79PK4SEpY7uLQA586BYsOQfM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f004:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6b47eed58c0mr8176756eaf.31.1788429663005; Thu, 03 Sep 2026
 03:01:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 03:01:02 -0700
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99455e.9266084e.bf0d7.01fa.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	michal.pecio@gmail.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
	zonque@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13da7c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15527c15580000

Note: testing is done by a robot and is best-effort only.

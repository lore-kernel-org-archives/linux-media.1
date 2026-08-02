Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DD3C81B2
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785690424; cv=none; b=nvJTycSucuHa32rppDKD+1iFPeekilJIduZsRxDP4kS8EalhOqTcQwqkoFPfnz303q5FZQE0Bj7uExBF+6B77RKLpncYZCDT2xcGzbVMUaxVpWwnep1TRLkNHdIAw+B5ekFzpBI4T9pH+dVH9rW8N6/T9zOf4u49V2liXqKrEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785690424; c=relaxed/simple;
	bh=oBp0Qfmvqr3lvLzHIJb49Quj0Z+YoHJbvTkejL88Jqg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aVQEM+R7bZ1EBM1m2pX/6XOQdBJSWcET8qMK5CCsk8uWDkwaJz29IKbbSxJWKPi+mxVN18s0PXeNsHzv1ObDjV5iMMBArK/z0fXBdPhu9BoqReGZOwlp5x8LWXPDI42hYUz5hEY8KsIBHYIrd8IN1gj0DvMzxVltdEcLzo9pOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ee50225cc7so3716794a34.1
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 10:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785690422; x=1786295222;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zxFXnSoB4KgiBC0T5VAyA9bBTcGnRnLoGoYzvYWvSBw=;
        b=R2ZQY1HlAwWZUpw95WGThxi7XyNv0WqhFTaGb7uJijf00onRsPP20rWt13EgUxEAt+
         +vfFGCij6mRsSEDWj1ow27mrZcnkz7MxkoxpZwdKS3hB9dsrxGv0fr2ENd7VbCQgGHcJ
         X+x5YTmrdErl91lU7mjmGw+ydGl51SkdYXX3Vpi+NV+JxZzwC0h2kV5IK0T0qydI/PQU
         hyxjGTOarqbpOiL4IQyMi3C3B5qQ8QaC31hOA6jGyVRTLKnh5fnt+eJbqPKZLMglH5LC
         cwNAu7zqk85r83eZVsX4rJiE+tBVvoJt0uJjUsYmktzh3FoJd5IeD8D4lzOWRp8ID/cG
         8Gkg==
X-Forwarded-Encrypted: i=1; AHgh+Rqk23A2+a8zWqXkhtMlsCF7bhzMspGQNvl1x0vqNOka9TzqsUXCSQyHd+lyfzEgLH7LFOBRsiT0BhJegQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJ2BPtHkt8lbaBXzrBf8GkRdFxju9M9Sp3bt0QkdadA5823u3
	wRXl2N/YkM9NjJ/eth7plIM2awwDO523cHrvXEtpyztTughHRudlod+5hxPZ/kWmmoWk5OpCM3z
	fuzWo7KDASjcZ1Hl6Y4eAWeOklr4vgqNlG9jt15duni+QTcJnwvuVucTkcqc=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2228:b0:48b:5dcb:85ab with SMTP id
 5614622812f47-4af5e07d704mr12408667b6e.8.1785690422033; Sun, 02 Aug 2026
 10:07:02 -0700 (PDT)
Date: Sun, 02 Aug 2026 10:07:02 -0700
In-Reply-To: <68dc3ade.a70a0220.10c4b.015b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6f7936.13bfb6d0.1ecdd5.0272.GAE@google.com>
Subject: Re: [syzbot] [fs?] [mm?] WARNING in path_noexec (2)
From: syzbot <syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com>
To: brauner@kernel.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, hch@infradead.org, jack@suse.cz, 
	jhubbard@nvidia.com, kees@kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, 
	sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6de2aeffabaafaeda819e60ec8d04f199711e11a
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Thu Jun 4 02:53:14 2026 +0000

    libfs: set SB_I_NOEXEC and SB_I_NODEV by default in init_pseudo()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c53db9580000
start commit:   ba3e43a9e601 Merge tag 'soc-fixes-7.1-2' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=65472e27d1590a04
dashboard link: https://syzkaller.appspot.com/bug?extid=a9391462075ffb9f77c6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a08f2e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1697af2e580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: libfs: set SB_I_NOEXEC and SB_I_NODEV by default in init_pseudo()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

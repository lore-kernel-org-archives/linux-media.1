Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFFC3CF204
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518515; cv=none; b=pwgX5wTc+dwhWuvz797ydJ++UokExX7H56J2WNbJimvIjX22jK83U1/wyicma1hmmA709wovIjo+2Ss1cP4zwtPyulZtp+Grk1kwTIS73A4noLQeqhv5HMG8ryhWOVcHf49O6GLQt3E20pw7KZ8g5S3SNg/KrLByyDmBU55fMiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518515; c=relaxed/simple;
	bh=EW6qJpawGZuS03oDc2CFP1E2PffSoyUBd00cDDD9ec4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0mA0zNp4qKCCwOo6z5o61LBR/unW3XF9vKMQnkKnk00h9+eoi6h0MdqtD/FFwIAweg8R/iDP7QYEgvwb2WIIJB5lSHmYTnM93K9GT+/rBnKJVYwSCIdqjBXzRdoAsgPvuGm3xrnjuDCJzVwLzUqSD0lgcrOy3DouvdtZeioFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQPyOanG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQPyOanG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so163458666b.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785518511; x=1786123311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8FrVsHtnUssQ9BO/owh8fqaNj4iu6kt+6mvHSbcE54=;
        b=rQPyOanGYMpk2CVsEI+0pOc1DCfjiG7TXNuYB0SXqnskNwGbeaQHuuB9OSHoUHTene
         5kjKkhR5S6LK+61+daNT/rGQXi0pZWOmg6P6ZQbJH7E43E0VCdTdfepb6GcjmYYcsSuG
         VY2JpG0/S8gPYkIyg9prfH3sXZn+husvrRhLUqjx++qsplnCAgT+tGk6ik4pbawRnKXP
         quCAbaLL9nUkAkxWn2FU14VkuF3Gfy8lialxleMlIS2Ktu8EP6w4apPSXxJ6okwfqLox
         3eLQHtSt5XPM9kBZe+eZDwVJh1YhbMA9Jjqy2zzzr7DK/azxl2Lvp87JGryr/2wPK3ec
         jPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518511; x=1786123311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8FrVsHtnUssQ9BO/owh8fqaNj4iu6kt+6mvHSbcE54=;
        b=rSc/39T4hkeEj6aSYWPLbdH5FuaSkWKUy/gaeuN3K+8sSAZOsXReAudJCNHwfvNBqM
         yBGHfCaofor/oxomLzV92ouxoqsQ+ahjGE7EQ3qFB/CqjHrzN+bkNgE6T80QQebZ5dbA
         Nc5WGPDC5IDHBPMv/2Z/pcuQdp6AIfiKoiM5RJSnIWV+YJ2P/JqqjHPoEwQbfSgN1njS
         r0vAvQd6eodk8EnKieh8TW237RiuziLbnjfQqyW/p6THriQR5hI6e8qS8XcJ4o1MNXg5
         T8P23/kYl+CrefrAfmZ+p52PpZyy9SuTeqf0+qVVa2afhf2YEiUKtf2ODNVLKWbxUiZI
         h2OA==
X-Forwarded-Encrypted: i=1; AHgh+RqbTfHUZSQISGyxJR0+F2M1QQacuNznDuMM0Uy4aWTn+t4tTbQNA11Zl+b8YJVfgafyX0oPM/k37LPfwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3N+p5dJl0XeA26t2iI33zpnjAkp5pg7kijyuXh10O+2Dy83qo
	rjq2VzsxwU/eCUKVjApjAV3dCoIupT4KORrpEhBTZBYBHiVzafK/FBHrAW8FTg==
X-Gm-Gg: AR+sD12ZT1yjZCyVnzk8pq4p7M6cmh6yi3uiAKyMP4z8kuQyCcBD6byGsAs3iwmwk/h
	V2e8GbpqCC5ao8AixatOmQZbJ89vgyli/0cSswQkN2y2nIOKvayHmJnqNWfmvSVnYpUcMZMIM9r
	HRx3jDLH3NVUfF6lvz8H1JtTDHIA2DKCRXvVGCNvw/vdWSmGdtbD/Uk+KtYwLm58gW9VDBmkKSg
	OsXb8+f/L+/Up0XkEbon7LzVG7ok8L9oIPn0n84tqg0PUcpKe8ZYHjDZJxiyuzPjBTNlGnxH3yq
	+alQqGN8DGvLl2wp7jds6Q+R/mVYwhEBcy+0jZ2ITcjYPvC7HunwwjleRGZtk/KVkrs3Xa5vR6n
	gawF61gWMu8w0QXlSUVlY2yN7oS0K99jnMv7/qkg+pFK8OEJ6Uum89tbQC26WlPHTq9wqFde6Em
	0XMJlFYTYVFh3t7fEuUDli2noZf8Tn96vCdARKZveaY4XDPWji4EQ4QeAhpScYz1rvS7w2w4xa2
	EGCbK2jaNVPuPJNqjbOs8IkpWhtA1I6FCOB2SvzcBRt/TGVKpjMrx+9wIEZzy3ihIy51tddYNSE
	NTeBlbjIIGyswhCPMdUucnbqbDe7mr86Eu8=
X-Received: by 2002:a17:906:3887:b0:c15:e065:81a1 with SMTP id a640c23a62f3a-c1fe7eef12dmr31552666b.17.1785518511048;
        Fri, 31 Jul 2026 10:21:51 -0700 (PDT)
Received: from dev-dsk-rituu-1c-6fe4dc4d.eu-west-1.amazon.com (54-240-197-233.amazon.com. [54.240.197.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc331fsm248635066b.28.2026.07.31.10.21.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:21:50 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: syzbot+070afba8f438130eca76@syzkaller.appspotmail.com
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_sdt_service_init
Date: Fri, 31 Jul 2026 17:21:49 +0000
Message-ID: <1785518509.367485629@gmail.com>
In-Reply-To: <6a6c478e.b5e7dbf9.21bf3.0008.GAE@google.com>
References: <6a6c478e.b5e7dbf9.21bf3.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

#syz dup: memory leak in vidtv_psi_registration_desc_init

This is the same issue as the referenced report: an identical
reproducer (DMX_SET_PES_FILTER with DMX_OUT_TSDEMUX_TAP, then
DMX_ADD_PID + DMX_START) hitting the same dvb_dmxdev_add_pid()
leak path. A fix is already posted:
  "[PATCH] media: dvb-core: fix feed leak on failed DMX_ADD_PID"

Thanks,
Rituparna

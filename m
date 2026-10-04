Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855937EFE4
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124760; cv=none; b=Kha9+q4i7RGqXRhcHFsK6uEGfuah5I3VjkmBuWJbwN2ELYRV/xu4otiAI0jCPAX2iLv+Gzh/M3HhQEwyEB46xPgGyqepaBaH4+c7uzfR1xBS/wHrUEX8ztmguHDYb4UUFvve8YJdydH4P2NgObdD6+Cz2/s0X8VY7hCeEeEK3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124760; c=relaxed/simple;
	bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=al3EXZLXn/9b10vUWemOML6g92IWw2g9arI06728RvP1oNI1F6xTmum/+UkwbMqEJx3HSjRUNGbBTGAC2Pjzhu9OaLQPLtRfi53izzUm6dXssKbzr3kJOI8PL0csbVgMtSveqBcrE8NWIpe1YnyZYeTIk+JFP3X+Yf5P9m+83NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpUpXCtv; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpUpXCtv"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so407585a91.1
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791124758; x=1791729558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
        b=SpUpXCtvjQP6jk9dw70vIY29bx7K2ZCTemoYQ9fedUVMvQYtsVWME2gAKgi+sGGTk4
         XCpkkUMTbYy6J2SvqgWH7XqZpfEKsr07fdQaMvecuwZCJ6rSrZfjgmbJz72PS4EWeCPu
         VHcw1T/LI5WFU2tesfT+z6f8Sr1wDeCBVzJkII5J9GOorZcAnA9D2w6/xKhxRUJ8yskq
         m4T8vKkbeAuoZTsTC4Pa+CAn5Z5EinKYfaGqSOYUVXNW9tBJgcjKZLa9WER4KouWX4A1
         EybFCvqflRy6NvOu3HR7EgIijYQRImyDyLMPwE9FZ7oO+gadn5Uy6PeYIv7zXzs9OpUL
         5taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124758; x=1791729558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+J67sV7H0tGHh+E+PgpmCiLdKxICybIqqLFNJrokbA=;
        b=IYJhwVVx4reQlROr/Y9t8H4bzFfKdyMD9o4hO4vbHnuMSKmhFV+iN8Rr4X+rkRjnNU
         I/3hjzxzaRr96IqrZOiCxyYSSJovl6gkhIcueg7QVQ7i2jAy+iMy4leEBnIiRSV5dJd4
         POzcAoCCDIxDs2emYZG8/iNCG5qgQwPES5zzVgaOYn2atEPeZBwlDyyfId8eNq89nEmx
         6oh3HtPiL+Vrqrlg6oC5kv/2x6PsUvOg3kuvS6t+j/EIYsvbAfcvn6zFiVyuhMx0OuYV
         Fm7qW2UW9fu9TmpP1YOuoRw7MRg8Df0c9qKkriaCZuR0cKhGNPqONZ1btno2NixU0PYJ
         cbsw==
X-Gm-Message-State: AFq9FYLYNOqRry/ZTwH04qY2S3I/59X9JuHtRNFOQziY5LjiqoEXvuyy
	l+o1m07HD5RcFZNKI01e/aTk6Fki/eSZ6XdRgdPmvobmmnjraOulAPpr
X-Gm-Gg: AYBFou23jBlKjhmTKwosYyP9h+nvek5jLBjtwFipynH/kC++RoFQB6in3YwiOZbX7B6
	KdAMhIqGU/TYQJghki87OViSj6kfqO1rNX4O8vUeVkp6HDqpUDHenZj+dU2b5MU2aWWBqrOHMyJ
	Iyd0ZdxrcT3Wf77DVpKf25k5uFo71At+kQoPDhf3bHjqcbHAUd1HPF+h/dTGyVW+vgaT1EYICDL
	uIeuTlQ4hIQagE1EsYa2RBaWikUBWj3rnCNalNLblTE+X91A+w+do5AB/Xi4bP0q4Sg9ncTstoo
	Bn7vnjpQYt537zWs0rvbQXm1Feat0OTDWLsTn71CkxXdxTqxLwB5iU4bFiHU1FTp2EGVCkELdUL
	s8EjW/f2QNs1I1spayZx0y9OOE/bel8KiGPE2UGzIVovUFOvXnzd0OXqh0x3GPtHlTvmWt3a+SL
	z2eHm4U4y9Wp8/5l26NnF+aot37+SqMzjQcVl8m9Nq+bxb3lMoCTDKl2OdlhMbP2wJcOvs9A==
X-Received: by 2002:a17:90a:c49:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3a6df937606mr4060767a91.10.1791124758244;
        Sun, 04 Oct 2026 07:39:18 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45f:e6::17:34f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm6896714a91.11.2026.10.04.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:39:17 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: syzbot+ac020fbb657e00356ca2@syzkaller.appspotmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] general protection fault in friio_streaming_ctrl
Date: Sun,  4 Oct 2026 21:39:14 +0700
Message-ID: <20261004143914.120601-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
References: <6ac21b16.34119e79.2f92f3.0020.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz dup: general protection fault in mxl111sf_ep6_streaming_ctrl

Same dvb-usb-v2 core race: start_feed() runs before frontend_init() and
passes a NULL adap->fe[0] to ->streaming_ctrl(). Fix:
https://lore.kernel.org/all/20260927061102.47451-1-ngocthang2710.1999@gmail.com/

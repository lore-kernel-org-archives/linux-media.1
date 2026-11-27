Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809805;
	b=a9HjNF5U/8xhAvA+ld2BEHty0J4k4W6Dj2hqeJpZ1N/htg3i17GO7eYvluoXQYWLqs0A
	 YWFFqdjNNInFTtuEtddvzqc0co+fWwvyL1BhbmM4XEfQQ3tCmrUSMJuVTXYN9QEnGYLB+
	 gF02CCaDOyD3x1f1vmJvl5c5pm2IoBZknQZbncKMEa5KMpkae7xONt+++gHh/WUvz+E20
	 ZYjoWQWy0gYPJW3fp52yIxG8hFUphELC7YvnLISGwZoGTf2HjhQBwqEC0tjliLBPsM111
	 HbkfnUfgBsth3ARYxNfvIGADAXCjJhN51mn17DDe8cuVMqoT3N4gHWz4ED9mDD7uLjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
	b=RCuFahixj1tLxS6jb5/9+Y2F3MSkvm+VXM3KaDPjpo1BiYWPfy3slXDA6fVubapxXpWB
	 qKyB2yzqtcee2rANQsho2vJv98bI9lyH9dWpwCU8NPopib3yGJ6B/kmIoMsa9vg7LPHLR
	 W0reLyPfPYcF/s+b7ItoR9taPjimfCyBeTUpRG0SBIkcIhfkiw3p8c5j+U1vLvHh0zJaU
	 LAjCezqiV/spSEXDqqko2KOHi9PxMh7chSxJEvUHkxD6SWWqDkQAiUDXSzBYYssi2643k
	 dCu322osWm+JLgi+Jh506D0lWbxxKedKhoXFsmHOl2S6muns4vyMsRfj3X8UozIY0Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfiljDbb;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68273606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 20:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68273606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfiljDbb
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386b3524415so979416eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795809804; x=1796414604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
        b=NfiljDbb6DVeTK7L2hVdTAAsihpTo+cVNJyxizo3O2jemefbHlokUdiQhT8bTNPPY3
         3Fcb5jyKkO9gziBjQGhEWvQRR7y0vNSre9kAYw5UrlF5cnnCcUqOdI93OwFqVRMml8lm
         dIUfx8vKWr01Dyr/2gspHi6nRGkNVYMvJNEWP5ynTagNE5F8NNWcploct5Dvda+9hj5F
         531HYYRBnFA9U6ZwxQR1wtSafpnJduOzjvUivUI7Wwf96BTa9ea11JynUH3S/asrhx94
         2uc8IF/wUcpaOaiZt94pJdHSa2DX70hFQh6oKjzb4vcKjCE+WCx5MH5eFdLYJ2GAq0Yy
         mFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809804; x=1796414604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVufmGKAarxmJzpLzX5jhmEod8gRto426LJqcynctLk=;
        b=hZ0Rga4t6YnmtDUbMxBgzU7p48L29vNyHNHxafN5nzo7NsdU5D2Ub81qbBuQqSuIpa
         2VOGXuo86ql7ZIrSqEidO/kHinc/QJ8x2ADtScsA3ZAnBpmlhpvxG9CXP1TT3hNgz8wk
         6275A3XK+EZLfS22uPsFLoXaWStA4ozvvs8wmHLs7PkGxkSCDX8BSYzCltCVGrN6nvGc
         67CTyAtFLs8GGsQzPWu9bH6PX4TLcTk+q+xvtHZZ+Qeckk31vwALERZq73kbBi/om40I
         cxyO9N74aax7JMFC5+aNbK85ig9FPEJG2UMTBq0RVdZjhqHFao/kJUtnVv5syyGSdVWJ
         IZaQ==
X-Gm-Message-State: APuU4Z9HGjcNF/oDVdJJ+b1InnKVgY/QzDuuVnO6+Ja5uSS6Pdn4/MyF
	elNYZv0Y7HJyfAiGfBgnAB7EKMsrgWGWhgAIHF2rzPkQtaCklNmfdP15
X-Gm-Gg: AZFdTZesrhY5Zhmdiw5Mq+mrtAZqPKb775VEPka1uXYF0X+gLR7M9dqdGR/yP0eiKUq
	G5ym58VPFQG5lsFCdXhDLlH226y+MJVIeNvtStydQeJ91Movcth/vjbx9OJOxrUeMA5dqK3x0GV
	4V58qmZou1XOU1xfVWsrwS+u0zgjfxVLDuNXIt3y9VxlW22hGifJNZJcbab4fBiPSABFOdNzird
	UHJqRvNdK6KcNGyfZ3cVtZh3epXpB2zDh4fScGl3+vOyfF/WFY5Y2jTWVO4xfG/h9+P1J4BjI2D
	AJIeZtNFksx3woCTaF8qGVUJwMlOJbchMScxLgPX1/esUIEQvTcc0dNchHfN1IiztGbpAY8Ygxc
	Bl3oDtSC7dKOZO54uRVZIg1pttkQab+wZCAJt3SQYNwcuV463V1qocUkAkO1XOxho9QGnd7BeFW
	cLNEYHX3EKgC/OHHsvu5bbpfdVR2+aSXpgLkswgU7tjwDb/lb2bYOcJf9a9Xrw6d0XKTPf3gdbz
	8O/hTkcwP98b4Gr0CZCWh1q7ySRHDfvS8K2kacJIuu3l3OT2tn6T3WSWBTKb3n9v3CVg04K6M6k
	ngy8hlVj7+36V9yQU3uRWCByPhOPPAExo26JoDLUR7WHPsa3LcxMX2Nwg9svWS96DnGn0hIPFVd
	zJDUtoEAjy9yjLmSo44rHPMRtTdqTWWWUobyv4sPfxO+l/5ooWl5cTMygQvf53pm7MgVOXud0Xi
	GzgkDhctXsPuZVkW9Qq11PCgsan8+ErTLV
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr38507977eec.2.1795809804291;
        Fri, 27 Nov 2026 12:03:24 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm73453117eec.15.2026.11.27.12.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:23 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Anthony Garcia <TonysTracer@pm.me>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Sat, 28 Nov 2026 05:03:20 +0900
Message-ID: <20261127200320.1575145-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <9M76pTkfqTFYYV0x7QQegwNjy5ZHwG2LsiwewU-KWrCowx5tvfp2L4W6za362xj-ymlfYDci3p_aGCNp9tPMPgy-jzBu-OFHHZJaNw-1o0c=@pm.me>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com> <9M76pTkfqTFYYV0x7QQegwNjy5ZHwG2LsiwewU-KWrCowx5tvfp2L4W6za362xj-ymlfYDci3p_aGCNp9tPMPgy-jzBu-OFHHZJaNw-1o0c=@pm.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tony,

Thank you for testing on the Surface Pro 7, and for tracking down the
avdd/vdda supply mismatch.

Antoine

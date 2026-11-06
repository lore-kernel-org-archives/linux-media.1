Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000801;
	b=Dm2gASpoCP8DFba4uGFoRQJfPxXdpd3Og/izQF38sJhMEBZdDmp87SXaiciA2rukLSN2
	 DWAf2mxf8rGmjlpE1CjgrFmcsGh2aSLXgWK3u67kO0kAoas7X76p448VMsU6KA+cF6MIU
	 F0mLqYcIaukI6WpTMjATjKSTRYBFLlhUjlfssmdvgqqr1G/DZjqZdx//YEEm+omnZfAW7
	 Yk0ig5aAYVWhiDZmoyoK4vv/ShwnyIY1hMY6YkWI1gZu0GC9qKfmyHWFjnuQ8ao+W9ul9
	 KvmGGhCPNrQLlni5LGvB3v3ZasL1wor5EOFiW/2JBdC9joLwzp4hxD3JFV1xwQGFWBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
	b=aRDUpu/Ca92YEKpJFNrhY+LE+YYwDq4Q/lSRTMSLaSTUa61bam1mIsa0OwFcwcnT0XBb
	 Tz4pN9LUSvKDvkwTL43km4dIFYIw2dC8egIDP5Yu7grzPGvr/5Ty4xgAPDovFWdAZWV1Z
	 WuwYqL7UYEZ2ioKHmtXe+bN6WWYwnrU/RXbrCA/sKJxq+Xtr7V1ski9eamG3RHagApCSa
	 3IhYp3k+rbck9HElRhaPYjLnqcwyTs1cE/EozHI8PgMw7zE/agvfeg5+saqBCOntvftSw
	 HLE7xePwfskqEF8LtC7AQ+JEjCDmHQ6gNfkQDfP8JRbQM5Zx5j4BHD64LOBc55Yq/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7wwe2pw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A18606A326
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 21:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A18606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7wwe2pw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12729245e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000799; x=1794605599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
        b=T7wwe2pwM8JaPUx0w3QuWttchC/LyJ97IohB1LI322K1zgLprOGMPddmGK8X/fF+R+
         iq8lHQgSODEac9uoJv5J/Lm9B5x863MxGiBjUQj/Wp1+KRMwsjxjmrpPvYnKOSwyo+j2
         /KW1IH/46KvckHMbwoFBVplgnDjK3zDbU31H/MxxAbK4LGcPyqf7wjRAnm4BjGsls9ng
         vCzlm8V6+NZ+G/EyLgUprWqQeOLW7T5qqOvlnbj6sDrq6vJOROP/2insBBqgCsQxVM5P
         zH08pndcKBHnWMhnbHRG8ufBKaDayPlGYqrZBrRNlPMsNmTKHx1XaRTrL64rG6tVfN3j
         tfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000799; x=1794605599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
        b=YkWX5/b8+W6TJOoubCZfQBd6FCdBBasL5UVRKjaz2mFGqm4jMU2AS/Mg88KQv0sfKa
         dR/7kBfBGzo6XoRXYMY0oqCBx/tY1XBQ3tgisrQhzwzHZG6MzUScm1dO6pTaH3RYK/4d
         1aWBejUV03YBIIuHaD8OxSz14fullJ/n6ddRVfEe3vosFg4tQ86P1XqmgK4eOeooiXIV
         N3lpKvx9i2m0UZRp44NYiGt8wUc8afx4pLxrwDJD59nIJgvKASCwOceztIwM91uSEp/E
         pSA65JcOhtTP4tordmdyKlv4Afl+/r8sXTWCT3XALKwKpQFAg+n0b1MFbbnX1D0vcvJW
         xsuA==
X-Forwarded-Encrypted: i=1; AKwUvBwWlYaDAyKoEGVoaxPSWjMekJo/Ox/Jg0OlkzWQk0XJacW2gnnkK3mMukVbpqpk4Wu6QdsaZETCxNG42g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eOvALDRF/o/2Q6MFtj4kDCqkwvF0ALmm2o8mIPh9nul0D6OpW
	XC1grB0NSWCc1oIOqSyHU017QHR36jUnQ2Jo/6FdhfCUYKJqX71gqQvF
X-Gm-Gg: AYBFou1AtRZ6G8kOXXbslCGiF0QW85JT25zZzG5iTF5BokdpYf7qKRL0abUKWnhcw7s
	Rxx1W85dxdsEM67TcF+SDJqbnssnpPQST2EfLebHntnxKGmWDj/I/XJ01BIJRBg6PK9kVSiyCgv
	x2RG4euC+jMt2fLeoWU483MXXlCSUiYER1Cku0/Hnb5A4EebAxdr6AOo54q+DV+DDvmTdJ/kjW2
	uYNA0XLbjq5PkUsZo4Fc/z0PmcVd+FwsK87NHjYjo3Fe8ftKav0TPSeZUN/Igu9er6cnS+Um4Gh
	9lCO1IwE3/9H+Vfl3Bh5fj9eoPb8+oaSnDr/vwTyrVj+Z2p3BN+l+az5PjkTBLuj6fizgPR6bTd
	iJn69+xgf8JhmqflGM0HGrEUJ3jfyWbV8LIZR4CI6yRAXC3LCFklrMvnWHQPC3SJMGmmi7oEfeO
	xX7bOsk5avPXhbvBT0CdyvoM5y2iMBH/YXnFTL5eS198/OtA9II/NkWXgNx8h11kbK8YLoOSGXs
	sfRYdaH6gYlNvzGpwkVXkEt4CgXT3MJACvqZmfkWcthfShXY0bmiU3hCUWA/lTiAIp/fOghhe+F
	YUnlHe7cZxNf15XvRpMWHbDadmiyMR8cJl6Se/zolDGaV8BRkXYslY1L6hwQp/tbC2Wib8tTU05
	NI7CACcexRKWz3P0=
X-Received: by 2002:a05:600c:8b05:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4b6e0172847mr72592585e9.32.1794000799410;
        Fri, 06 Nov 2026 13:33:19 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm5758043f8f.29.2026.11.06.13.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:33:18 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 0/4] media: ov9734: Support the Microsoft Surface Laptop 1 front camera
Date: Fri,  6 Nov 2026 21:33:16 +0000
Message-ID: <20261106213316.104672-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Please disregard this series. I missed that Tin Posavec posted the same
changes on 17 October:
https://lore.kernel.org/linux-media/20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com/

Patches 1 to 3 of my series duplicate that series. I will test it on
the Surface Laptop 1 (IPU3) and reply there.

Patch 4 (control event support) is not in Tin's series. I can send it
on its own, on top of Tin's series, later.

Sorry for the noise.

Afonso

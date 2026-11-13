Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536466;
	b=2r5odQTHVryxLxO1EAo4TOlJ/ZDVPdbAu0BRKi/ryJjh1V0vLFI7vBM2fnre2LcVl/PD
	 KmWqGJ/5kp2IiLuFYPqSHKOGRfb7FpSTn989R/CupbtNo+UagB+22lE0TaDe9Tr58ongc
	 r++UitA19M2MinCLFIkYgRxWnT47fKlQhdH1MxblyqO+oJ/icSGTYRB9waQpt8oMwrDEN
	 z0WyKoaaMMbNqY9nnxyF5/WjICyxGVFSWjQcbpNx4jkLFRhIPmAJjsvtx4sHqe9iCc01u
	 yq2XgFtgCYTEaZfUVvxI85pDo9e8RIJ+TdorHrGOLTJQlAjrcmossDu7/zwdUbMg2yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536466;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
	b=sJv9P764YWXetL+Oxf9zypN3QFYb5H6cIJ+sEWobGz8iYrks35tqAAkDvi/zFx4FLgCC
	 GUoqcPbyfzOVZNl9f5i/3uHAbBHni5oCD4An5GECIbS1JZrAHrU6zhUBlQ0AqqPdVihj7
	 cWtzxy5BUC8F8BUHubI1Hh78Y1LdrAcvypEbg+8A8UmyJVJQcYazdToy4w7eIrBCFC05u
	 b1M2bBOBLToYAwc98e2fsJpowb5NKkxEFcU+FI3ACiM5gng/v1wDxEYGYkEhV3+VvDIuG
	 GaZWnUHeVvsbY7MsL8BLs6RG8y21DxoKZmH/zXE+gx04PHZWsgFoosLlEjvX8fUZ7gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C9606A31C
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b30ff12f84so3787517b3.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536464; x=1795141264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
        b=DHVaZ+JRPe8F5Gyj8xvV6SZD6puULpFBE0l8b8dv3Zx6/JDCaMTXwxZrLJ3er/PZYq
         IqiSTeAL+xTxUHH8mvD/ELt/JNiMh1rinwYQsmSRJrGN9xqD2iJorTOTMtZNcXysi2GH
         hu19ehHIt7bCIKIIvCne4ziEtFE/ivYf3lXkjUORPkxz3WnLpQxPU6bkWSVcUpHl/wRE
         UPGLsuUATON8lFClwFLHuY8F1ae2Zanunv150a7WwMCOOS+o7Ip2Wmigx+h0kfnjeDQQ
         LLmZLG2unTmQk8AxPPcBVBDEejvXnJFhNCpevDqL7PUhc7uhkIAdWt3sebUMOFlzXEtY
         VVkg==
X-Forwarded-Encrypted: i=1; AL+hErGy16PdSqzKIzn517FDhullTzZNiEYKy0BkrIyvST6QLAAtu1h3h9piXX6KyoeP5Qt7BoxoscTkg2V8qA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9j82apavEogTEtCahoSyLr5wpvXVHEhHkDY2Pb76V3+uNwaueo
	QOjqsxTOSD53I9cHh1TS2ONMQ3c0ya5wKOys+B6g1BdGdCa8XeWccO47
X-Gm-Gg: AYBFou2RLEzy+NiI4LckZQX9obbV5mOckOmN9/hzCj2sekozRhHHgLFZIcyoZffO/SF
	5ksBJjrSmh9djHPF9Fjc6H2Ho9xdlU+58SpqkN8B3blSUJ3i88NP0XtoPjG/HwtImspdqBtajMv
	DBRzGMt8cDcZNOKPST61PwvJbHBF0jHypj/MFDdIod31KfIyUptQPk+OH8VglQm3JC0cLjGzSAj
	6Sgs8IaoZLRjVlAdeVsCx2N1BHbn220cmCbch9SPemgokxdmdXfhALZdOqA324jptp20ONQ42CW
	6wc9hIsXPk5oiqVIrikKe35Xq85xHK3oC6YmvVVIUj2QSmAF2I46hsx3QAVde5N7IMI1Dzy/ITF
	VaZYy5zNRkx3ucgI3jAtdRSLnljwT0W5aKyVB/t5WijUiTJAzxbMpQ9X2EjCBbG7zau2CrQgQ7d
	ZVumgSkC1zbIfAaLP+wFv7SVROIuNb/je4J7Jepj8Mas9+8xGOsZYRfo2xCau//ctk9f85/VJps
	qQhE7NHJHQlhhpKGyHQsjQ3ag+O5ZzMyppwlLapH85VoUIoC2Kg15RfcUESugKLNRlVjGX7VJ4G
	wxQHqE2iiIWi3wVGfR4V5gceOw3IbMckrML4N4+dBJ65vZxZxRt/lMl3GXswS4WUC8rF9fzIgLj
	nMUi+GBZHD7Eip3VOU0BNBWlKQ8Jq9WJP
X-Received: by 2002:a05:690e:168d:b0:67b:ffed:e1c9 with SMTP id 956f58d0204a3-67d896a37b2mr912238d50.37.1794536464486;
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4339c3sm890660d50.3.2026.11.12.18.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: operatingsystemsdepression@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joseph Telaak <joseph@telaak.dev>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an auxiliary device
Date: Thu, 12 Nov 2026 21:20:41 -0500
Message-ID: <20261113022041.74295-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
References: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
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

On Thu, Nov 12, 2026 at 11:08 PM Gabriel Gama wrote:
> Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
> before publishing the new handler pointer.
> During unregister, could an in-flight IRQ still be using the previous
> handler while sgx_data is being changed?
> Would it make sense to clear the handler first, call
> synchronize_irq(), and only then clear sgx_data?

Yes, good catch. On unregister the data was cleared before the handler,
so a handler already running on another CPU could see NULL. For v2 it
does what you describe: the handler is cleared first, then
synchronize_irq(), and only then sgx_data. On register, sgx_data is set
before the handler is published, with a release/acquire pair against
the IRQ handler.

> Otherwise, the auxiliary-device approach looks interesting, especially
> for keeping the display and render responsibilities separate

Thanks, that was the main reason for it: gma500 keeps the display, and
the GPU driver doesn't need to know anything about it. The same SGX
cores sit next to quite different display hardware (gma500 on
Cedarview, simpledrm on the CE5300, omapdrm on OMAP3), so keeping the
render driver independent of the display side lets one driver cover
all of them.

Joseph

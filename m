Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058753;
	b=hN5brY882AokUYikoadCiPKLQ8cGsIG2MEQ8b5N8IykQysuFupoyNrEoJcIUsMvehMsF
	 4mgUQC6Po8vDGlrEZQifjET4vLxdigASVQ4EgWsO81+pgSdG0Wkgi+UAaBYvONkDq/UcL
	 EdBQpv5QsPgd3h/dc8FLR9xl2obysp9HuaaELaZxb077XJclMm5UKlMJcVataLEd4Gqxc
	 aIn8ux5now4LlqtxehnZKtULe7cSIlFrovR04b3RdYwnSnms1ebj4lLpW5qHeyUz7rJVs
	 NuVZkJbbOw/ZLIprdfCz/3Np3WCmHwNmByZe+bfPU9shRcXqC51braQFtY7LX95pPOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
	b=L/qv/uEtM85kCHARjaOQBm4gZ48xCpORzanPqdrqaaHCNJ7AzlrGnbV+bX57Oa4ve85m
	 fEg97cVnurL3XQGhGFXEaFib0nhndUV8LYES51gwoG0b4GGae9lL6vXZXW2OtKgn4NMJF
	 VfamltscESk9lohXZ5QRXpTlbfOcVt/XEeXxgr7HlC0Qcdxhz+3vRpotIUsMO+aZHd+Eu
	 Zhc3QRxpY7R8WjtILy2XOhNqN7RtdK6c35cLobRZ/tzag+kbHyoci1UyXOBKTAdlpCiXv
	 sJ9JU74IRehZ36Y1UgOzltqZs79qtJWUIDza4RcycIxE75Yp0oV2fVX8rR/h/TDiItA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C34606A330
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 13:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C34606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so13311445e9.0
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058751; x=1794663551; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=OX9Wvyqy8007fdh0vspfUTVomQmw9PZiknsy2c5tog70UB6fuZRwbW7XHXN1J7dMO4
         cXCFUkWsD95cnboSABiiXlg08Uu4I+HTc8zjdUceXlI5inNzpxBtxxqr7R3pCSwDpXwo
         CE3OkHwSLTZgGnLpEurpgDeDaSYS+cn1atLNgSOQwkJt38Xbvu+2WtXjV/+89TBi4PB2
         p8cmW8TDjUbSZdU/FpDUWxtIKoIksCgn8i5FwRq371+bvUyjUTlSH2AdDzgovIP8LEjC
         2ZxPhknYZJWaE61ooUpfhdTnlOlt236Wi+ITT7QOF/E11WT63CmozubP+WAEAdiwBWv+
         vLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058751; x=1794663551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=w0cmGeNcBdLExf1d0exG/x0ySRPS0UY+9lyJ86hbzJIv/9SyTmgS1IO6t47a8EUSEZ
         hOMw7DFTOO8KumY7FgY/i1xCf6wmFUtyWHGhDVCctCnEgZIUK6g8taKz0eNB1Uewarwo
         XjEGOS4eNUNhMoknzSEfDrfEe3jzaQbGnROcDlu71Fys4k5YoCjUtlL11cEGCLhMSZl+
         ELKI8MnSvDnVaAKXbH/NJR5gQpP5W9lTnCyaHIY8wl/QDmM9FP8K4B3XhsSpOM4REqfi
         W3abaEnEpg8Z3jqS3giX2nI1kuH+NsfYpB+qL0e47a4QORVNxcDxxefBkzA7sFKht1Rt
         Tbug==
X-Forwarded-Encrypted: i=1; AKwUvBxABsTyE2buzoQfwTRjA6MQ8XE6afjBTVXbIYL1DqXZAmPMCD1q5mPb0qgkqLz739d6pzdAGb58LTnisQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BTiBrj0Bb+bEKXejjNzpmtu/+j9/IxsJJ5VbRU6DcAamravVC
	nkMHNvqXSsAjnGaSqGPeaAPqSsrNPWSP+xjE7IJBvrGsAWweYQ/33M2T
X-Gm-Gg: AYBFou2U0ZiyQuQFffLCcyY2UxUMsXv/2mhIgAo0rwrV7V7qRK6QF8KM9e8Cdkj8ppr
	zc6GApCtaI4csFYIzJoxg3VHP4zumhtGO/6O3iTrkrXZa5bS1vaRQqUL16LyC2ACPlydh5AXrMp
	l3UZsywYfBCTpH5ZR6YZLj/JvbYGa+HSmCHVp3odvU4RIcltCSclSVtqrWNi4ZbMPZEPuCn62/R
	5xKusFbexUNBO06jfoHHvkbY98MBVb2lE8p+FIH4HIbHxudzo2juxjwg7jse6EpdbYdL0jHMWUc
	prV0XrFnHexyNeBlY4latQTV4c8kP+kytsjCbyskuHBoLZtBJfHzDaRruIlbuE8E+wZxQs/vmji
	/mJr8cnaFRacnRdPHx2HY/as9QFlQ9+3tj/NvaWBDQfpo6vh1NVOPrzYPdW9q4hhJZhinbMh2+9
	pLhvgeO04gjEx4Cv8eSuBwa0510B4cpGXwq3uBykbUq1Xw460sShmTdm32mgfvDdPVPfEqlGs4s
	VwQs4sD8bXQYT2xyKpvF02CTWw4ZA1lJfcVzJSGS2PwQgPCscJXwBe+74vl1HLaqROliCvBm8Iz
	q79iQeyfSt3S5weTDYNQT2tRSXVTiPDz4/v5A3KhqDDARpiJPOuN2QhI+L8Tks3S7FaD0IQ=
X-Received: by 2002:a05:600c:4e05:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b6de973c54mr87477975e9.10.1794058750949;
        Sat, 07 Nov 2026 05:39:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e2e9ad7esm71189685e9.1.2026.11.07.05.39.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 05:39:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Date: Sat, 7 Nov 2026 15:38:56 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

> +/* Bytes per pixel used to size a coded buffer for a given resolution. */
> +#define RKJPEGD_CODED_MAX_DEPTH	2

A valid JPEG can be larger than 2 bytes per pixel. libjpeg-turbo sizes
its worst case in tj3JPEGBufSize() at 3 bytes per pixel for 4:2:0, 4
for 4:2:2 and 6 for 4:4:4, plus 2 KiB. Quality 100 noise comes close:
2.75 bytes per pixel at 4:2:0, both from libjpeg and from the Hantro H1
encoder on an RK3026. Such a frame does not fit the default buffer; by
your commit message a truncated one fails through BUF_EMPTY, so the
client gets an ERROR buffer for a valid picture. I can't run the VDPU720
to confirm.

The default only matters to clients that pass sizeimage 0. GStreamer
1.26 asks for max_width * max_height / 2 of the enumerated range; at
65528x65528 that wraps in its 32-bit calculate_max_sizeimage() to about
255 MiB, which the driver keeps, so 1.26 is not affected. Its main
branch (08ea5bc9fab9) asks for width * height bytes of the stream,
which the driver keeps too, so these frames would not fit. Both are
from reading the code; I did not run them on this driver.

Would 3 bytes per pixel be acceptable as the default, and as a floor
for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
subsampling is not known before the header is parsed.

Thanks,
Sergei

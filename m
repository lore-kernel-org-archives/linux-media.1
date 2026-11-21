Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287749;
	b=0jxN9mvSjR/tWw7p1SvINzYQ3MBjnCi0T6bPr1yH4WLrI+bJuS9wR3rd8G81a6KjX/Aw
	 Ay+068njhi6d/QqoCOlPZd9RhBnUNc54aT19evqgVwRRJFKhj0MPmq0h6enNd0SRpOyE0
	 c/k9vNVmVYtOIk2lsAXD+0gA0IUfekN+EUPXL5stk9R7eU/yDpY4hbP7aGUkhWFrNAJF3
	 BUt20YzgPxRdGRrxX2LWgmj8yKkqh+Fh7Y5aY3F99wljTxT8g9URKNDm4axlZ4SA1DmAM
	 9jBhb7mgsyDmb+yotIt8IhXnJsnbGjjD8jiCsC5XtlP39CXutiRz6PDvYiflyWJkNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
	b=O8QWYDC/iqOwROIyV661RDy6tIwPwYWQVmi8FzWv49t03Vogk6D/yJJh5pdcE3a4oC59
	 gWF0nj4vndG+7l5QOcoNK15KjlLDG1kRuWuN2M5NIaOQVMcDjyf3k64PAaQV0VKQz27LI
	 k630QXmiax9ceckrICLlPpE13XEbldcem4piJ6kFemPfkgOXNqSO2enBh6+8Blh0MBrlH
	 fA7rl6/4uM8b4mjDKS6uVTiyKPN4kQSEqqGmMYq175cly1chlU640U3P/V4y4h6/RWLAV
	 k48CUxaveNF0uXGTJq8LSbjL/eM+TjgDB8Q2DY7ur38dtUZPobviPiEanoM1kzx71yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB710606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB710606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e7af9a67fso13004556d6.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 11:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287748; x=1795892548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=tF0L4OWQ8diIx+BfGSc5Q27+DM9xv7zG+ssN6agguZg8GXUKNxOk/7p4/jJcSCCt2L
         vWMIEgiJZG1GdutpyeUCPGYhzouIPKFfhcMk6jhEL0nvyfsw5ybTJ4naJgl4pGSTOhh2
         cPjORvo68aZQtBovC1k2TesMjjyk9sQJ8DmTSiX8ZSxIHjHLkJ8tZ1KZjKss2/5m64Nn
         3hnpZLekEE29JzQtCPIAvvlOk4KQfFVt9P6A+4ia68AhL8EPofCK/AW94UthF18ve91F
         vIkmq7CCfF5QEjijJPXFfIgVIqeuQTkPTsoJjWp1LwsbozGMHrURGRuExm3PP66MLE4q
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287748; x=1795892548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=cDifEoeidBIQsQiXC++dkgG1al7c7LSsKZy/TmmOxpVuwyf1TW8XcsgECSrEKDyc4c
         fgJM4Ey+mNapdv3oeeS13iMWCZWwzf6zh79Wlgz+GBalAEerEG17rGrgbQYskJloxT6n
         wTim/6F1JWpugXGdFmUw5Dz77e3Ya04ka7yOcKv/KLE1YGMJz4heQFaTyvCZKLd/e0Az
         4ufLdIwdCGxegeoN/9gqetXjvHPjC6r/6tW2A7g7hNcWn/MdeFn38A68MUsE/HkqaCRu
         nIN4+tjiLA0CKIewvEEetInoE6EFgWRCnAbnyccw4dGUoibEveCnDDvCBRQdWvo+OqLL
         yg7w==
X-Forwarded-Encrypted: i=1; AL+hErGZUFkJdOvCJgrLyF1jpDcbkJiRhcYUvadKnXLS0Y4/yqah8uzWawse5pbc0SlJEHauCaSZCtq6WL5JMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/eJyJ0OLVAKNc52m34POTYS5L76Vfo2eqQgRxyuhviIHPKG7c
	P0u1U5Zr5WiYrW2dl4TYg5m07N7WON/MJcgHph0pHvGZvOmwxrdZvGiw
X-Gm-Gg: AZFdTZd09juef54aPk5JTGaJn6O3je9FBQRlQ3zYoKUI7Jd5QpPDE4DOPAaz2RhzgS2
	GJLW2HpF0qEB2LsPQHoFLiso8HTcRmRPj4ZNjcQGY95YBpw2DDgX+RKPDUCelPNGwxQtnQ8i0rL
	NyF42hXM+TTMTBMBCKMMgZmkMZswvyvMOsU2reAOtC6tBgS8ZC6AlmlA2f5RhmNa8LLlAUFwHb4
	nj5gvHKQeXb2F5h2Eh7wqQMHs7nOiPzJfz6q43/p6IMMv/KdV7w+sStrm65NbeNIgcbFg5/ba7m
	Rwacq5hTbO9kPoMHLUcAe3w+ozzMT2hZsNb6xFf6vcG2eynIftzN19uO3zon9IscDIOs+YqUh4W
	rRfOa4TsA3KLDdLrd8UfG22aigMA9ahuE/I2PRb4OVgMvJxD/DZc/bfZpvcpMyfKEOOY1H0+eEq
	lsfgI62xVAwMf4A4WnU7TxItJSFFw7yrRL0fdraJnJQPx3sHXn0glEPzZFqeYFt3Fy+xZqzP629
	i5bAnIuFD8IJe46DdsNanFDbRECL0CL6wfG+PXIhcywIwYn2S896wOIOyGs1lH8dIps9YcXrIF8
	4aqjY8+Qv+rac2IthdTOoVpeZpb/gmZ1xrRuhnHsbgBZPDgk/oZTl5CjM0Mjk9DnbfLnLeszXej
	ahhXL0LrTz/imAV596FwlKMH81NeyyPPYDxLD3KLWAEzeRaHBsYrB
X-Received: by 2002:a05:6214:4e90:b0:91e:a629:ff9b with SMTP id 6a1803df08f44-92134b48e03mr101782516d6.52.1795287747625;
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a15b99sm59575286d6.38.2026.11.21.11.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Message-ID: <6f70f43f-4fc3-47ee-802d-50ebc0a8394f@gmail.com>
Date: Sat, 21 Nov 2026 14:02:25 -0500
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset
 GPIO handling
To: Sergey Lebedev <lsa.uz@pm.me>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Jakob Berg Jespersen <dev@berg.pm>, George Neacsu <geocausa@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 5:02 PM, Sergey Lebedev wrote:
> The driver assumes the sensor is already powered when probe() reads its
> chip ID. That holds where the rails and clock are ACPI power resources,
> but not where an INT3472 companion device registers them as regulators, a
> clock and a reset GPIO for the sensor driver to consume, which this
> driver does not do.
> 
> Request the three supplies and the reset GPIO, and sequence them along
> with the clock the driver already looks up, in runtime PM callbacks.

[...]

Hi Sergey,

Tested on a Surface Pro 11 (X1P-64-100, LCD, 5G) on a v7.3.4-based tree
with out-of-tree CCI/CAMSS and SP11 camera DT nodes and George's DT v2
patch on top:

- avdd, dovdd, dvdd, clock (19.2 MHz) and reset GPIO all come from DT;
  the sensor probes and streams 4224x3136 at ~30 fps through CAMSS and
  libcamera 0.7.2;
- All three supply rails are off when idle, on when streaming.
- v4l2-compliance on the subdev passes 46/46.

I did not test system suspend while streaming.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng


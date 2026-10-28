Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=0OU1Byg61w84j7VGipk3oX0aizIA2YZrruqSU+YHkipwSe3dgGXGxElF5KFMjHFNQqpx
	 2J+aNqqcEgiYzWxMzhx1CREDtGbfIhk+8PEK0CfJoz6Rmwd9F4uL532M4XTql8fZlg4+8
	 yvYyhz5TutypyOnxzzQVPdf6KmS8BN1pkpv/iyBR8v1dXHFut50mEAAvKO7cuob604yVA
	 +PlHKJFbqSznF88w6CccPBwncNJlhTtQLRdHWz/DNohlCz39AIFbPmf0i9kI28Zxg28mp
	 Y41PNSO7JFldIXmmDd9gklWct/HpKBIsQ9xKAHdKJt6ON5BP1ueFokkh46AbGiHDUSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=4swRgHsAlFEmtuIJTA+Alpl2GuvPx9pZLIZJQARVvqZtKeseH6RJWJk/MGBzwLOk/hd7
	 7rSYR9/LoiJYHE1TNiyZ0NcmhNl5KgjpgQlan3lpzOBHAGKlCJO7uMZxeX+BiYGf3kj3z
	 tcoqKGUIlcCK+vHvDGi7Pj3oW0lU1LHkE+YVa6SpZ+UTYMLBLei6dhZofBnLG57fV41pD
	 pEC8H5hqz9M+qdldp1W8gZul+MOxOBwbaAoMKWxRmETrB/GZuRXTgLm06Qcgo5Hc3DZCO
	 dXtcZmaqf0ih8riKX+AObmPFI4eIgBF9/KYI+NEBLNx+Gzw2CAV/HELwpyipOAznCjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40712606A329
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40712606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11173205e9.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=m7pDrwiaEt88q/KIJOh02r32xLMyfoXshNrIC1yaWbHY/ZXo7HVnXcHu1KCT13qT5Q
         7mTf5jaIDEpdBwnF/7r6k2V8NjyxkL9C+D4HzE5jYI7aG/xLUnkL/dUI5LPVR2bOb54e
         40m7VC54nRrDyVIycgr44LVunOfBL4NV1lmotYaqlB4Qs09lqlt+3BNES4ZnAnlA8lJe
         Yojn6kW0PNxIelHHty3gWSK8cldEs1YcZ2ZyAczZLlILSI+2fMART2eAmU5kZnhD4OH2
         Ji/TYxRMpienc1zAVyx6AH4y5IT2EgK1roBn5RlgmLqc5eeyQnNcVJWImqYFkyr3JkTt
         NvSg==
X-Forwarded-Encrypted: i=1; AKwUvBxubKycPVWUowrA85C2QFiWEza1QCwnJxVGYqUzt6lVmMT19/d6nyPAKLeBW5DdqA8x6aEGEuR/yxoFvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYxoLsxX+HVgAEqRrrub6A6fh3iRc9nOQa1HonovMWPYfMdkOF
	umss7K90d0aUn6YOM03bc7cEVULox9Ve5ut9GzldpKyi0L/8ybmXo16B
X-Gm-Gg: AYBFou33b19/xJFyWjye77TGBMSICmu1apyjOvO7Qw1bRYhN3wQQRitkoPJqEonx5sF
	4SHMEjxTjmk+pv+nu5dkZrbFzlde4BbFn9L9X/tPn+JgT1Gshxf286P0ZTouQBRw6gatZtc8RoT
	AZnMhbXImB7EWQKuF/gB2ynN4cRSJD6JpMgDT9RsdOAd6ROoSoq6ddwQcuIh1zfSrU3GM5JwzNW
	0tTVg6l/8+TySmDLMzGRqMGRfXn3eNoSTqC/JGMGtSllw+TASibDfhY+w0uHIb3/zP5TH0SDiM6
	3XU/HEGKIzhQsZISbQ202ZR8uNwe/TOB8vsHtLjyr/vksjOQcU6fdvPfXcaIB9hNyx3JHkEow/N
	djc6oH3lI3FrAHUeGQrdopxToE3XLkaw5UAp7URqSzEjKeGMbE3SGJB8bFQA3EmK3/OuExf+Mbf
	C4Ckb5LjHK9ZyUl7T9gg8gRtwai7ODPFQbguYAeHFi5XfAE6LmYyEjqvnKn2psDq4pEmqqAzFnl
	6OzxkRN03MUf8TaxXok/bQAgJqj+NJvKt+wTPEbnVBwf/rrLMN9UJQwpy0MwpD/QrtwGEtFJk+O
	vvccAr1nn2G8vfPUM1l/40fTyA0jbQGWp9c4YcdWWnPc3mmZ1/oOkJ4FpawOOAoag44al3nZ4rE
	W5R+IzSonLsYFdQx/
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel

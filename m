Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5624534B7
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390469; cv=none; b=r3nJEdYkmNmcXVeVy9yA1qXRsKmQvwR02+9dnuBTeHlfUn0wWLL3po1Vxn72Xr9DoB3PjiMo4BGPd8oIkVvIl9hzq09zhguMDAwNpYRrzluiWEPJSXDamyTr2CYunrTvBjSAusMvNosatosBLCnz1e50K+gLE4iKOB2dl4+Tda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390469; c=relaxed/simple;
	bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SICBriC3UPGpIT27HjDEgCIPdlkIlMgNSmhHFXbvVdV14y1yks/u8Uy3VCVr4G5nCKyEA/uhX/F6Jujs8eDl9Hz9yNck5TNST+HCYr8UR6jM+MuqUcuoaSl2l60cEyOklR7Gs1sznuIVZPB0UHzLm2Y2rC4mryg1qsLgjN9/0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwx52QRw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwx52QRw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1076008f8f.1
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390466; x=1792995266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=Wwx52QRwECmAS08gpuFlTTY+yO9Ek0YyyZq50YKLVFBgZw+z4Bd7lbvyx9uOPNO59m
         o8cWZC3Rrk9N4HuqZVlXlM8Y9asJn70lttbQBWw9Cd2gpLDc2M0J77BKMfvSW/1FH+Z+
         dHPiTJ14Npnjvo76bbjzWzbPFnvDqCpF+Z6G13x+Oy3tgZ9Vv9THa4V8gr9pTDAYXZkp
         TF7FzkhUoiu+wdspBCqoOf5605dMaCpKut/S7KVswt7bFu2Sdx4qjqz1bsaU8JH3Owa8
         EnmXJF3PJs6k0Q3L+WqZWT9PRnH6srXEUK0mCpnd3tD0qLETvmaSQIS2FXz7dgqZ2dan
         ZpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390466; x=1792995266;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4zYuxAOTe5hOZO9exG0p9T3Y5OYZrqCGPDtfN0/quA=;
        b=btPs6e1gH4FTZtq3FX0f5pPs6BHZYDqCpTHrk31cImEvYh8mYwXCgtFTNPhfZW4gvg
         tVznNt28dLn55onajXSlnUGn843IQ8EEOtFgP/QaaC5YRxG6jYbbfBmSNUK9NiDF883j
         r/uNLTsH7pHcbkJ8T49pjJjINYcFozGAcs/MFZAmBSffs2XeD1iO8/Nmc22NTcqBMVG7
         WPnqdZWt9/L9AGgwmaBQij00zbpGQBh+zc6+ce2s8Z9s8LMzihodUqDaLRrcUL9dedL/
         SBj7WJuj9VPZGncmPc2cXj+AryZkAgJFTTQfBUGbIVK798V/mquSJpPZdRMpaTNtHk6H
         7f1w==
X-Forwarded-Encrypted: i=1; AKwUvBxDcQME/C++vRzTrmyniYY5JrYo7XkxzHMJr/jiwag+J9r+VlnqIgROfjk7ht4KNHEyTq7CTc1u/vHJRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhR61iX0wpiKI17k9SDh0E1xw7H83+XdTn/IImKLYh8xhRJuEM
	VFaDK4P181xMRcfEWIhHDZRBMOk5dWUyFjyH8+oDV7RB9XO7hvubYLBS
X-Gm-Gg: AYBFou1MSCRVUTwy97a/D/Id/MY1RTKS6IRlSXflzLjXaWljVvQ7+jTXca7cYy9d/Ze
	v8/YVD7LUWjHwDEfc6ERthy4cD/p2iYrSojCyyXM5gvdhr+/tItgATBwmmLXYOknLoEMhKichK/
	zyR/l2z2L0J4WytiC/FBH/7n6Tbei3bh9Y83eBgu6NJHmCRd3xhNSPD7TBieY4HXeDZsqAi4zRY
	smyBCirHGaPLuE6yF2/RkRiu+YPBWzuDPTzpwi8KdF9OP4vQZX8MSxVcqK5q6BgNNfJ/gqwRyV5
	qNVzjxWI3Uc9tZk0mzaVrpwJyOraxyYbAvg5r/aJjATaL2LGPKBDOzBkabnn7BRsLOhMhmEyUJA
	aMQMvb+H4f0GBNfnFbT3PgGqpv8fzSSoNiWv8pxv+Gn+fl+n7pGvKo1kt5VraLmsF3V32q5Rnfs
	KnEWRVKGC8xh0SICnQFrR/p1wsymUOvUVSA44pCKtBdIWIhzii6jzGLWZluFjSdtDjLYyyMpyFU
	UhQAhYI7j1GAvnWsAA8+QGu0vtzm5vqx97Js4AudomYDc6P/C7iNdFWEe+589kLR93DMbuZ
X-Received: by 2002:adf:edcc:0:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48e07f98e75mr9489300f8f.19.1792390465937;
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm21937786f8f.26.2026.10.18.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:25 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Lebedev <lsa.uz@pm.me>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Date: Mon, 19 Oct 2026 07:13:21 +0100
Message-ID: <179239003370.10232.14441777373870206418@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-1-cd35434cfcfe@gmail.com>
 <366fba16-a479-4e4b-b6b2-7d0dc6ae4fd4@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 08:03:11AM +0200, Krzysztof Kozlowski wrote:=0D
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>=0D
> Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)=0D
>=0D
> Did not happen.=0D
>=0D
> Add only applicable tags. Otherwise please explain how this code was=0D
> executed and tested.=0D
=0D
You're right -- I mistakenly carried Sergey's Tested-by onto the binding=0D
patch. His hardware testing covers the driver/series, not execution of the=
=0D
YAML binding itself. I'll drop that Tested-by from patch 1 in the next=0D
revision.=0D
=0D
For clarity, I carried your Reviewed-by from your v1 reply where you=0D
explicitly gave it. I intend to keep that tag unless you consider the v2=0D
changes substantial enough to invalidate it.=0D
=0D
Thanks for catching this.=0D
=0D
Best regards,=0D
George=0D

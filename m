Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060851;
	b=e1QhWjb+xTZ7aCk/F9FIsqHKw1jyk/Og2erbtDjmyZGPqkkbyR3n/aUNsfN62WvbVMJA
	 sI5FNhg/j2wOFukTcojEHdbCVX/z9jzJv41pTsmdQcBO9zKYXYE0UBKLCpj7C8ZFOJbBM
	 I6TMXauBtMWJnQIAZ3Ud01kvgGHG3jvsoZhrcO1zBTSX4I9b7V4TijKOmP9LiKzT+OT7p
	 jpFwBQ1CUpJX/EPnkgHvr4ryvr1S1cau1R3Q+yO87GNUy/uGHNopzG0ef9nWM9va5brsV
	 nYGa37vvHuVOlVLPO6rC1vi41h5TabPfyJHa6WYhG76PXyMetFj+kwNs4/vbBdIUw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DBMcm3MQt3rFtazZpSgZ4Roq5LuM5LuAD32o736vMeU=;
	b=hSICuiIUFOphXqG+18j1af36+in4Vpw2isAGYbODVAtNBK+TB1Qjd+CSLQUuvZHfVMb+
	 UdV7Xtrb3fOuCSLvOidCHnOs39CmmdihdDnJuZ0mx7j0K3MXEejwzONnSRRE+sg6oM4Lo
	 PK0irYZd12Z1ZJaDqPebeToSzdha0oM2kdoXFNwPT/nI+UWufFKSXj+5N5ihfYy+E0d2e
	 GEcNRHzEGGKWttsX2xwyQeNnm0qnTN00WqD1SNrjiydjWcKIwXQ8k0Hp2W5YO/FXN1Cli
	 G9g4J6tkLRzxmhnLe9G4Xnqj47j+x2SbX+EVPvHwvytbnWOnzgubazV7yhEdUljPKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=LP1Sjd95;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FBA606D809
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 14:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37FBA606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=LP1Sjd95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DBMc
	m3MQt3rFtazZpSgZ4Roq5LuM5LuAD32o736vMeU=; b=LP1Sjd957bnsCYYNwmid
	tnXPzkXLU9WjO7PrxKfLGp2Memt2xtgldHuJjte2xxhlmzIakSm1tR2544isJ0aS
	gENrQYPI6UGMOZeeal3xYPXpFTXXxHnyCK7Cu6oHTU6iz3vyZaPO0XQzZbrI2En5
	UcGUCs7bwsBtEcK3I24kv9prD1h6UnjwUc7z5fYj7hXPvUFNc42Sw9KltLhy5xUv
	1FQICatg9yuwyiSWhaTE7rZqrjzp2e9BYBZshwNCmXdi/yUcTCL1rnY4oqTfpBND
	RXk/ciSddnF+0ee2y1B0TmH+Cqxx/Lheair+MwvZzycx10FoCgXXF3gc7buBbmot
	Og==
Received: (qmail 2528043 invoked from network); 7 Nov 2026 15:14:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:14:06 +0100
X-UD-Smtp-Session: l3s3148p1@/U5RV7BfEO0FFu4j
Date: Sat, 7 Nov 2026 16:14:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: mail@andrewgigena.dev
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
Message-ID: <au8yK11wC6Tyvcuo@shikoro>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
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
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>

On Fri, Nov 06, 2026 at 06:35:33PM +0000, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Andi, also no driver changes, qcom tree?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


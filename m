Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74183221DB6;
	Wed, 22 Jul 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703070; cv=none; b=GkuVWXab/3SRSemICtSY7erTWVEa/VFRqESI7Ba4CAOfAsqpnVL9jyFhe8h3lFFsEqhC1BRvMzRSHmUJJOQe8Xw8VwnqJweyyai1blW8we/SlTiL3wZbmLVpTkZP6K0YYY8x8CniDSy6Uxu6Z9kNzefoidsrlzgIPhzGjnVk1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703070; c=relaxed/simple;
	bh=nTVUnPHo+JOCU4ePg3hwXci0zj2vBjDGgR2CkZN0sNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTeatgjNXqHPatnXxNx0V24ymp5Be6tWwh0VWluPU6fX2GTlb2W8HFu7VHpjAFLVZ7qPMfZHCCX0bxXJEDpGUqnbEfTBioGH0efCJccIr2MViduBpstGPeppEiXA4U3TMYhyj4QVEASFwmuemFHAIljENVlrBkqzSXi68PTZmFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRCthPFg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRCthPFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334501F000E9;
	Wed, 22 Jul 2026 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703068;
	bh=XbU+bg6ZwsEyHk+zpRhw2zmNEFtQxYCPOkygb2uLuNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lRCthPFg1FFiVTtGTQ7+7B0vmnbTj5QG14jMAveHXdPWiZmmgwcNrF5r4RGKwhsUH
	 rrqY/c6xSh/BCZaFCZ4gakCtm0/Ijb+YwOnjyH4GuYTmloutqier0NbLKUYrlenLuk
	 k+HM2yys8zKzYMo4VUrw2Zv8fCo5VohbGuN6JIl8+s9U5+vHTdXG3xbM9VZJ4MXDIw
	 cQuqJpBs7ycDBv8ZAcDhpPcGSupsTa91doy6MQoVi3orwVYgXouEqF5UpCNnn7dlD3
	 iYQXFiWfXaCwG8s3nayPIrvTSDB8NbA23dH9mEA9T/0TrQCTH55xnqatHgQr5bt6Yh
	 i9kMv41hLJ2Fw==
Date: Wed, 22 Jul 2026 08:51:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Message-ID: <20260722-pristine-lemon-dugong-ec2c0e@quoll>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>

On Mon, Jul 20, 2026 at 09:50:34PM -0700, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-

There is no such file on recent next and cover letter says nothing about
dependencies.

Best regards,
Krzysztof


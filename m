Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357939;
	b=J6uh2Zk0WAh5nyfXi2YuESmsTpwsxUqYFL8ehRkfevpJn6KTGzfrRNkCCjqUQt9Z/yb5
	 EJ7axS5npT4v7ZgNDhRgLFlw5CCLNsMnwstEq/GNjgMJUHxWPUE4IqW/t561NXn0yoh4p
	 SDwWxLpzbtqWWUAaClg/D8jveM8O+fLUBsY8UkEsCxGO8TxWW9fSaej3JpYDIYurPmYDO
	 2ptkKlUIyV50MB6Yina6G3T08GkzCeDwl5dvOO4UPJN5QRyoQ1z39L9SX9XyrkRl5WvHd
	 EWpzEHeuY803qOjmsPFa3hA84KCy0r+JhrovOkyPG31OJl+PvCfBTNtdjngMgGw12Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357939;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/E3RY52GDj4TNMPPJaH93QZ9upC2WYUMh4er3d/oEMM=;
	b=Y0tUGUs3SEYmmsLu9rIqY0UjxkAsbTO4ioWlwvrCad+bV7gLX3JrDiY6DJ0NWVG99aVh
	 qk1U4VckBOnDiquTfKt0ymiPiT1u5UG1tr5VytKPWjnMa2KA4UWUh5sHkKSvbtOvfeG9r
	 hShovB1cxO+IP8f2+YI7b4sWzXgsm9yK4cHxifII4pLroY5FgD4PRVqE28XaMtn6twauQ
	 veHGJLE3sI+Yo7QAc6jHIrmHH7hCbMBiqSUM+7nKu/hVpgDIkQV5L8XquUS21Ahvwwm4M
	 e9qep8S9L4OISHEJDNWzZ6RzIfvV+DvfeC+QuZtM2tkor+rXxUb0bDy/4PAy0uxWw5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4+o3+72;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04718606A32A;
	Sun, 22 Nov 2026 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4+o3+72
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819BF1F000D0;
	Sun, 22 Nov 2026 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795357938;
	bh=/E3RY52GDj4TNMPPJaH93QZ9upC2WYUMh4er3d/oEMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4+o3+72Cc1R3NCJHpERN9bGqHo1CVD9lM+q+e1EpcDasyHI34kSLRw/icFD+kAaM
	 uOV/32mUe71E4q4P8VWkus81cwG6zCLxU5V80/qXmrsyqw2hPdOxemaIMIcuokuCf/
	 gwiB6LT8h0/MHJOFuI+ugzttKy3u0lKZ0kFHcdSt8Q2B1CuEDNvA/qORcMmhR/6d97
	 S8ASgDsuajn8KlxWpu87s9oOlPbOFa1k2tkupaUUU8UG54wulUCPVM7G5RTGCpFqy1
	 B0epHNwm7uPAtVXSb1+IpheegK1fK04xgCBDRbCBF0Vn2neJvsp8fVRm2+rHMHzOPe
	 7qzIcTfPlsytQ==
Date: Sun, 22 Nov 2026 15:32:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v19 10/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20261122-pristine-vagabond-coati-f6cfd3@quoll>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-11-kyrie.wu@mediatek.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116013402.1273016-11-kyrie.wu@mediatek.com>

On Mon, Nov 16, 2026 at 09:33:35AM +0800, Kyrie Wu wrote:
> Add the MT8196 JPEG decoder and decoder-core compatible strings.
> Describe the child mediatek,smmu-config phandle to the dedicated JPEG
> SMMU configuration syscon and require it for MT8196 decoder cores, so
> the compatible and its hardware requirements are introduced together.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---

This was reviewed and your cover letter is vague about tag removal.

Adding new properties at v19 is more than unexpected. Honestly, this
should not happen.

I drop the patchset from DT patchwork.

Best regards,
Krzysztof


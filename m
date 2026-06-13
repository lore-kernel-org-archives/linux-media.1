Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B942773FF;
	Sat, 13 Jun 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376125; cv=none; b=p6s/ewgsjBEX8GZVtMdnpCO/2s3/K0hRynrQuN79HGQcrIKdV7JGozZ987Dj+Uxbb8ICXIbZml+cXlLkHFxZS3TgD/qWNnZxdq/WxzyWQPPoWiSU3dDwbaZoj0zEYX1ivoROq4ovu3qdDmcfXKaSb3rj73XmV7/0j6TTSAw9YAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376125; c=relaxed/simple;
	bh=DD3epTLdOI/iq9gtDq4YLdI/6YH7kFcJpbYRh73j9fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVJ8Kam4y8qe2PRao4rEczvHkRybq2noddryfw1nlyHDUEuO+OcFEPjx2z2B9b65/Lzmdw0wZ7228cvzrNXmGXRGHoLzJURcsgIGjEcWyzkWKHR1WmhzY/u8f5zxiUywB8sm/isqCTeGM6tnF/UsPdfv4XUti68rHdZzQwW6XZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhUejQtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhUejQtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ABB1F000E9;
	Sat, 13 Jun 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376123;
	bh=mNwvGYybZ8Yy5CUf+N/gqnjWQ0NStQU7SxwA+Xc3aL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhUejQtP+7X6YRBNQXX3C+h21jqibS0/SWMqI9fF1PB5w2A3b45NwQOAk8W13yM1w
	 bWh8JfwusyyvIr71/ajE3MOSi9XKFnYo6Wdo5bTcLxxNE4+c6UqXTKG8XqqiKXqZuX
	 py0ZKKfGjPdWgKBmvz9LDlIGt/zAB9fNa4bqPxV6RQyoJEW8udd06noOIPN199/J/k
	 y06KJHUNqwakZpbsaysmYPzT6C1FpGn46ZKfN5blJh66/AYXb2FcXbQTrgw3Lnwbv/
	 O6NR38LumwHDXpyqmwhOMsEG1kAT/a16pI8uY/pTa1qPzmKvPh3CF7W07Z8w08UyfV
	 QVBPyYuj9Rzwg==
Date: Sat, 13 Jun 2026 20:42:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <20260613-fair-ultraviolet-dog-fece5e@quoll>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>

On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the standalone Qualcomm JPEG encoder
> hardware block (separate from CAMSS media pipelines).
> 
> Document required resources briefly and scope initial support to
> currently used compatibles in this series, including SM8250,
> QCM6490, and SM8550 class platforms.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++

You already sent v1 and you received review. Quite a lot of comments.

Please do not send duplicated work, but address the feedback.

Then version your patches correctly, so the toolset will work. Sending
duplicated work is not making the review easy.  I am dropping this from
DT patchwork.

Best regards,
Krzysztof


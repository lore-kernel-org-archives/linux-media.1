Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189776;
	b=eUWLJvj6ekRY8qthppxkLi4NoOZKGLioYiJ78A9IWfeY/7a72LL6EPJ0FZ/7xNDLfqrL
	 okDI9XzhibULxcOeFh/YGcp80uZ/6T52+6m4jpTe90SRQpRtB9c99MrRYwebcuoPrjKHF
	 TUMvolrjvui6R/XjM72cN5UZIObKgqI5kPKUjIsNXkUemmykN4kTZ1NtpHUj+LzY6Mkqk
	 3XCaNiMQo0R4+2h/aVVOAy77X+P212wZuRhgKZzC33eNabIM2XJfQvXJnD5Q5gdf/WwWf
	 QnSva4hnrjaR9jjSLB9SJlKXH716DRtnjTmgJfNwkwDGExoIXxeVPUUXOTk6A9kN5SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189776;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PT15hZrsV2gtc4raeVCA1OF7bgelk/5T/f1X4EOOnYU=;
	b=KklohdtvhxdoJfotqMP2WISzcNDKE7Ss9WfPG0N4cOsA9BwZJNkNZlfiitHQp/B5V1RG
	 0U/eYHr+zj2mJytfpYEb9HX+FkhuevUyj9D/ZegI1fvybV6uekAc0jRorZf/dJh9+lz5O
	 oxmxUImkcXF7DdU8fN6oRV2UD/VkVDWBBA5Icx5W1zXBxVbC7VQjvHdFtKM9iIIiOz0oG
	 t7lnfO4HyKwZlXHPKf/0BfbW7lM9lQ5Frvw6G0pkuu0YRSmlCWu+uBK0/JqrkAGf2FbsE
	 4WNPuU+3b5mNkh3hJPj2cuQuRxQ1o3yKWjcAAmCtga9i0a3wbw4dDsJxB78k/mw71lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="com/B+Qt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B907606A31A;
	Wed, 28 Oct 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=com/B+Qt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36841F01825;
	Wed, 28 Oct 2026 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189775;
	bh=PT15hZrsV2gtc4raeVCA1OF7bgelk/5T/f1X4EOOnYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=com/B+QtHCvKrTu0jqM601D/1rwGYmdu4LUPo36GMx5NdNgRPtcCcKQAUK9bKxKA8
	 JSgpvA8kip3US/shhLTkQWXMo8qTZJJjmo9pPeTH8+kMGJBkfRM9/TyWGwZb8eEf7D
	 8xO99z+SulKuG2zHrIHyq0AWZ752mUqolZw6Kvc0T2zP8tkrAnV98AulEVSU4NoP3A
	 4X2F+g2SoACFt0lJgdYeG1q8tj924bRg1xmj9ltD8of5kFZpoFuH/fQtyJw7bUaG5J
	 BWzlCcsxvgD2RjImR5PikpR0M3gStdu7/CGUBa1P9JE28wODCNl+dVF9S/i7EBkmY7
	 ASp2QErZIfoLQ==
Date: Wed, 28 Oct 2026 13:16:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: media: Add Qualcomm SM8450 CAMSS
Message-ID: <20261028-spiked-musical-doberman-7d7fb1@quoll>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-3-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-3-vz@kernel.org>

On Tue, Oct 27, 2026 at 12:49:52AM +0200, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8450 CAMSS device tree binding, it contains
> * three CSID and two CSID lite blocks,
> * three VFE and two VFE lite blocks,
> * three CSI test pattern generators,
> 
> Six CSIPHY blocks are described as separate CSIPHY devices connected
> to CAMSS input ports.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  .../bindings/media/qcom,sm8450-camss.yaml     | 274 ++++++++++++++++++
>  1 file changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8450-camss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


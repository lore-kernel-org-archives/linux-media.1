Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882FA33DEFE;
	Mon,  9 Mar 2026 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046210; cv=none; b=FC5BOXVgztnE6i4YVioEzOZSvnxi0WGUCrZqcx8JlZpBBOEA5Df9+Z9p+gFfdfxXw8Pv8aQR+oKtG9kUR3gifQWPgDCwJ3FXZHEyFYqD+KRLmc8ZHD1woWnzefoGYXbf5VUniPTqSrEMYbzEyHlYu4zsV4vDAs63nFXyVZPUz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046210; c=relaxed/simple;
	bh=FxAl0QIkPydcsKFhFovYjX6NFk7PTnRn1mUjEL9vK3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFfZlfn3dvzjgcyBDCG5ZiyTbRWLt1N6ho6WywmBAnmgBY7IdesGVQlL/85n5qH8KULRy6DCNKY72VtZui2KPB7LvT0EWntDo66CX5/ugLSSO0FY700/z0BWC3va8qYwxaVzG/1CavLHPZ3rd80Zo5lFD4+7LjuFO9nhxD+2gcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NM3yuWFh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NM3yuWFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773046201;
	bh=FxAl0QIkPydcsKFhFovYjX6NFk7PTnRn1mUjEL9vK3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NM3yuWFhnNgYJktHRtGaEsoEEo/PYzJqlGkkh7OcNJBvXA4IVULQcBbyH3NtZWqPh
	 jpKl5L9x3F9FiKKyP4XgDcXA55+L2gL3AWaeS2bu3BAcC+WUF24DKykNnAStxwGYu0
	 7Kkchxr0NdKBMwvnmjSWaD6prqtw7bqgK0fxi3DMnrQQcRrkZ5spvEnjRMOIrVTF+w
	 lMSuwRfCJrF4fdlRnO/CRmHnKxhxjifWeHEphUHwQdI0Tkj5tLcGZ8Qh9zk1Cehc5T
	 eon+ToZ2mR4jiZAtqG/RVMNO4l49NZAVD2mQG1xgwMR7+pppeub+kox3Iwo+92qzOj
	 VmUgFiCC6TB5Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EFDE17E01B1;
	Mon,  9 Mar 2026 09:50:01 +0100 (CET)
Message-ID: <eaec4b1c-469c-4f81-884b-3308aa85633f@collabora.com>
Date: Mon, 9 Mar 2026 09:50:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-1-0cd8d2bf28c0@collabora.com>
 <20260307-complex-finicky-skua-bf52bd@quoll>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260307-complex-finicky-skua-bf52bd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 3/7/26 16:33, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 03:09:48PM +0100, Michael Riesch wrote:
>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>> the RK3568. However, their integration in the respective SoC may be
>> different when it comes to the (currently not implemented) split
> 
> All this says they are compatible, so express it.

..express it... how exactly? In the commit message? Or what do you mean
exactly?

>> DPHY feature. Therefore, add the RK3588 compatible to allow for
>> future differentiation.
> 
> This I do not understand. If you just copy standard rules from
> writing-bindings, then no, don't do that. It's obvious and there is
> never a need to repeat any standard/common rule. If you want to say
> devices are not compatible, then say that explicitly.

It's a bit of a complicated story. To keep it short, the RK3568 and the
RK3588 MIPI CSI-2 receivers are compatible at least right now. In
future, this may or may not change. This depends on how this split DPHY
integration is implemented -- and we won't know that for some time.
Right now I expect that the phys property will become optional when this
happens (at least for the RK3568).

What is the safe bet here? Going for a fallback compatible and adjust
everything when the split DPHY feature is implemented?

Best regards,
Michael


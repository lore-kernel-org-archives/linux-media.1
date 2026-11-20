Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198018;
	b=czNUrVLB3ycQ3SDTqR9LfJ5aUGhHRRGJSbb/c/txk6ieZX8+HB0QjuCUFj9BLUa2UgCr
	 Sn/IiNkRzmmpI18MTSWqDK8r4Dtg1XRXiRqxA5GQfHGAtcyZ4i3LS3tlNARUs9XzlbDUC
	 mybGZT5FEoJqVV5mlyiUpl1Zg/rW94ImU78wH0XixDXGTBYJjmh9A1YADYS2I1msn9sdJ
	 0vNf7+hWvrZEM+IHA/OkIHiXXuCI9cJOYG05p80rNQIu4Y5GEQGfRVywto2BFdp6L5/8z
	 GbMFIh1vC7A9/fmOailPnzxVI0bnZTJ4eY223bs6vqObv79CEC6ZEuIc9/wLFgBqKZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198018;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RjQSrv1yD+Tngr9908szhX2afLv1bRiBxHzUtNPcG6E=;
	b=xxOsMly8PbfWrXXJhyLNildlnM373ZtKROCStWM9SxucEcHNc4JScLRyPXamd/eq4jd0
	 1q4TAAB20CzpkKiIgAHc6M/NgtNYj8HeGPU/qfu5vJgdQuIPh9rCjg4KihgrvICEOcxJv
	 ZQYdmADcbfodssUKX3tx5t00VYVcrmikfSb3Crl/sD8DJe7Cfn0ROvcRyo9XYP0fQCfHU
	 FHQUG0N/8xJ+Ya7IT8OVdxhL029DD8+D6EpYmuKyac0edTRkER5IS38amUqXv0mdCgCJv
	 O7Gfcg6oRuTOEjdkMB7r3TpsErBEELwfSiSrClq9cyjUp9TKeSkrVF83pAtcjHdWd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCAA606BBDB
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCAA606BBDB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795198015; x=1795457215;
	bh=RjQSrv1yD+Tngr9908szhX2afLv1bRiBxHzUtNPcG6E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rOCoNZ799DIhPxpjuvHDzG4WSh4IGY5ImTaGHS29EQMtn3cVEWXlab0mzCZFIS0Mh
	 cjZIaUOOoXi32qn6WzJm8A+YcgQLtJfZhmr9kczULVRxKKiJ7+0MTYz02FJOIGidVL
	 AszJ3bEZMXIfO2fG6b1/YiAA4fF9pxN4gG2+gwNpm39JtXilEU3K1+cEPGFFtBLdKQ
	 sDTi2RFne5bIKvneecFirtrtn2eyQ6TERSI2ZP0tdYXRsSL9HuevPJWdjBoOYUNzP/
	 pbSfFdWyEmmhPl3FbcCEKFUulpUmdmkPcQxyjddq6eltcQSoOBL80J1hOk3NgajtYz
	 B6t4rlugzOewA==
Date: Fri, 20 Nov 2026 18:06:49 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <qjgDobQW2E9-BIRG3wngPQtbXtCcJGG9P9wsJ8zcsv_mSgsh2L2V1_QFe87ecTw2AqfAmdsZnByIr3ZufwEm3BTsCd9lS4i_sdlpcMiryxk=@proton.me>
In-Reply-To: <av9vzLSureeB4j41@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me> <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me> <av9vzLSureeB4j41@kekkonen.localdomain>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 2f23f7fa03f776ee8220f7e572cc51da66405739
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
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Thu, Nov 19, 2026 at 11:53:16PM +0200, Sakari Ailus wrote:
> A lot of this should go to the cover letter.

Moved to the cover letter in v6.

> Does the sensor support other number of active lanes than 4? Very probabl=
y.
> But this isn't reflected in DT bindings (and it should be).

I can not test other lane counts. The phone has only four lanes wired to
the sensor, and the vendor register tables only set four lanes. So I left
the binding at four lanes.

v6: https://lore.kernel.org/all/20261120-upstream-s5k3t2-v6-0-dd345fa4201c@=
proton.me/

Thanks,
Armandas


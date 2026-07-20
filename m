Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165C3E6396;
	Mon, 20 Jul 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558224; cv=pass; b=bKJaXoLhAK18dN04CgLyf5qEtb+8T9cjsQW4gAnFEPmGtC9D9jeq+bA5t8eYHHwOWBCiSXRWRQ8pElIVbO+WS/XGF1yyGxLeUyo2AxEvFh2HXu8N7+FyCG3lMtuakCunSUbsm0z0k64gIxWrgCjcFUJCn3dLj9MIUYMWXE901Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558224; c=relaxed/simple;
	bh=CoOZMtk6XHc1FjNBTqqquHL+TZcrggfXywztwhSjV3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fasoNHLG0AedIjd7qAHzcYsts4sQSmLOYC3gWUgSppZD60BNd24cq0FNLzBbe3EEXa6WrsyiM/a6pyACHjmRhtyqdrowfGPgApBt9VLfjSOz9hZIdJCEYXOeX3X+YYS5dj6Bw4pnzQes0rFTpZ69Y+3PW8Gwenp9Cx8w9+sn8cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=BfK2iFa8; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="BfK2iFa8"
ARC-Seal: i=1; a=rsa-sha256; t=1784558205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zk2niH1F0FMDASBDJHW4T1D8LwCoRgcWxVsvlLMaRjbQsjeqcJRa4ZsIaWMHGl6mRLmN8TL9r3ieALJC+rC39gKlHV6J/DOfDElvc0TD9c1GVAoMG7stVx56dhHJxdq3XiKLr1fk25v9I6f2cHbGFbDXUydZm1lgWEgTWJKKyIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784558205; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/wsZJyigWi4VXhv0iWi6BonguYvhNMUA5fX0Vo4g9SM=; 
	b=Bahm1CcytqwOeGqj/TFacnKL+gJo4FJlvSJU548ZSxhNJzrbjN+bJVdYSVbk7jwouMR4/4788vE9ggff4jBWxGXf9dqpJ/NhiTOmC+jd4cvez/0V9OLTx9h2bRRnXIEVkPuhwqxXvkv8ZlggfrB2MuceuZtbS17QXBdC+IQVY64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784558205;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/wsZJyigWi4VXhv0iWi6BonguYvhNMUA5fX0Vo4g9SM=;
	b=BfK2iFa8lQWfSq3+niadj8GnCtMfiaiB1NmvDt7uYAmxPYsCICQAdtxPDEQPT5Md
	vshKmokcYoTg814I1OXngSt73AjlHo7lJPN0KJ6bF6N10kZET7gJTNEOszitK3iRAB5
	7U5rhp2MSjOwZrDvX6jtGMy/J0PKdmg9hsuSax/k=
Received: by mx.zohomail.com with SMTPS id 1784558202613285.0487905776356;
	Mon, 20 Jul 2026 07:36:42 -0700 (PDT)
Message-ID: <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
Date: Mon, 20 Jul 2026 17:36:37 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
 <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/20/26 15:30, Igor Paunovic wrote:
> Hi Dmitry,
> 
> Great to hear it works on the 5B -- thanks for testing!
> 
> Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
> It also supersedes the suspend cancel/re-arm I had queued from the
> bot review: with suspend refused while audio_streaming is set, the
> worker can never be armed at suspend time, so those hunks are
> dropped.
> 
> v4 follows shortly with this plus Sebastian's dts restructuring
> (shared disabled-by-default card in rk3588-extra.dtsi, renamed to
> "RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
> reference + unevaluatedProperties).

Re-arming will be best option if it works properly.

-- 
Best regards,
Dmitry

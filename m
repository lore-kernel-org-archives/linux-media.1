Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E974499B5;
	Tue, 11 Aug 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456916; cv=pass; b=gy8c6dXy3J2uokh7R1E8h8IJyphWdZViqcA2+n+6pS8j+V6fjgFotT9j4Ea5uySrr9P/TMzeePomWeSM5ipefi0mMV6um2ZVRKJt8yNbhODyEkZGwnpekpnYKfWZO3S3ufZfHtRQs46p26KCl+GDRFDINba3N1xYipT4ZjXRNco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456916; c=relaxed/simple;
	bh=qq8eZMaIhUSHOu1rfSPA0zvsZ5LZLN1tMGpZnArNA14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxGFJzWEvp3/5cy17Y7YHmdw4dPTz8x7GMUsGVVLLNEiUW/M81uQsUlqvlQNnM6ZTrgVoq6QjUK6KD3HjRiWhawX+T0z0PE2R76t+T0M5odR3eb2h53UHOM4mGcZ24F63FvYek1CduhMUDxk/3YIHl/Qzt65tU/oSgr16Iq0MKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=jd1+QhTc; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jd1+QhTc"
ARC-Seal: i=1; a=rsa-sha256; t=1786456882; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iuiK3C4LcMuuAYXmzi8fmH4rIobNSTRbQuOLKD7s7cDn+17sSNrfTYNEOycgPnohwEc9XIySHVxfam3lekwmofRtTi27n2r2asJo9v2I8wS5uglq4ZF+7bfyMbf2DByctu5pyRtbk283WZczEPbqESzWhZ/g23myPaQBF4CeiaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786456882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QTfxfEAC0awN9pGH45+tTaenBH8A7dUoYGm7pbjaa2I=; 
	b=ErHxCO9IbTfIGd6wJVjZionZxuFsgvHPShn9LR62GylF52mp7/h4HwHvBkxDZtJPhRRJQgtH9F+dl9fkaz9lAuwuq1DT13BsFuqlIxk3wGoe9uNtxwGDIMBorbzm3FqAlsxqmk2xBM6JLePyMafI6WcI5LzbiyGR7VXNV0TU2dc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786456882;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QTfxfEAC0awN9pGH45+tTaenBH8A7dUoYGm7pbjaa2I=;
	b=jd1+QhTc8gfLci1PVGSkH1sM5/sZWgv3+AEyQc2wcPn99fYDlqFOuZXEf2pwCHtY
	F7UioO+Y3+m2B/dDA96KSn0mAtfYWornn/xjVpsLlAKGKuQlfPwPg4ohAMsmr+N8L7o
	hWdKqQXV+NTh0Mwq4QrTEf4rOJffpCaIynF/OoYg=
Received: by mx.zohomail.com with SMTPS id 1786456867632374.5144013643186;
	Tue, 11 Aug 2026 07:01:07 -0700 (PDT)
Message-ID: <816c3cc6-fe65-48fa-81d4-72026b66abcf@collabora.com>
Date: Tue, 11 Aug 2026 17:01:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260805154039.10161-1-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260805154039.10161-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/5/26 18:40, Igor Paunovic wrote:
> Hi Dmitry, Mauro,
> 
> First, belated thanks to Dmitry, Sebastian and Krzysztof for the reviews
> and testing across this series - much appreciated.
> 
> A gentle ping: all four patches carry Reviewed-by tags (2/4 also has
> Dmitry's Tested-by) and no changes have been requested since 23 July. Is
> there anything needed from my side for the series to be picked up into
> the media tree?
You can always send follow up patches separately, referencing to this
series in cover letter. It may take significant time before patches will
land to kernel tree. No need to wait.

-- 
Best regards,
Dmitry

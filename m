Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B12F7F14;
	Sat, 25 Jul 2026 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002332; cv=pass; b=FK0UTHhsiWN0FtHzyr0mcsIaw8kvouUzuy2hctd6rCJQtP1qtX9rB1oREyTxtRUw/Qb+buBEyCnClE4kRAOR81HjgI0rdQTXGNw+054BqGxZs+4uoyyR6cNUDXsYL7AvChM9pNrEBonLX2WqaHiwv37bouJlJRNEWvEFz8O3lPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002332; c=relaxed/simple;
	bh=pfu3zjS5WkePtFXxcCBU0wjbUnPANiPCh2t0VuuKmA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fS7vmytu65Y5yjYGtuzwuSF405JPx69HFrR4Y8ZASgFjjsa3hxVX/MNPGLGgS6GGCYJ8Cs6svxMpdvJd+RPgx1akOYHofVgK1Ij/+f3u4dv/6DfhfPp+W8TlAyo6cjHXQBGUl95uBMQemHwvQ9bP7MtQ+UbcNyG53NbIZ77NJyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=QoxLz1Cl; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QoxLz1Cl"
ARC-Seal: i=1; a=rsa-sha256; t=1785002311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g7YI44btuhP5MiuhLz/EKXLdg/YtTeW8gVShiV1mTxxTJwifsf9emILB1ZGMUuh6GdtsE89iFvJTHCIS01ICcaJ7oXQozj4ntO/LNd1n72prj0sGB53Iq4hoc/ASuykEQ0hI2emKXdEei1yEVfwdRhlNbV5tOHQ+KGRz/8LrzSU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785002311; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MRbJi/1N24OFbuQVxv7b6LbUHMhpaoO6runK3Llbbuo=; 
	b=EnzwLV2gCMlit+OUkB2oI3lT3BmjSxyWs2/HpTfyxqkSkWJC1aFlJPX5AiIFsva/rNs2boJ1B5ozIGRYI2nbsAdRjA842oQrrjuCnwUgf0B06AI8mUL1+ixpkjWmFEMseoV5drqVauy5xC29SlbWhLzpnDPMEBkPg3+MBHXCKYM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785002311;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MRbJi/1N24OFbuQVxv7b6LbUHMhpaoO6runK3Llbbuo=;
	b=QoxLz1Cl4MVPsAUboaaFVWBpj0jAbdcFWzmd+I9/f3+IXgBtzt/jDHrwzhJHXdaD
	mtzTwotmOVlbnFaA8AyryTfq57v2hE7nMXK9bitw2oTa/SE2WC662nQJXS5tWqsbJgn
	oTWTDmC2PFQJ4Q+a9A8hfZmZpc3GLCOCqo4GFq94=
Received: by mx.zohomail.com with SMTPS id 1785002308379763.0905164719212;
	Sat, 25 Jul 2026 10:58:28 -0700 (PDT)
Message-ID: <e1034df6-3801-424a-ba1e-a03d61b37222@collabora.com>
Date: Sat, 25 Jul 2026 20:58:23 +0300
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
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
 <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
 <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
 <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 7/24/26 02:47, Igor Paunovic wrote:
> Hi Dmitry,
> 
> Thank you -- and thank you for reviewing the whole series and testing
> 2/4. It went through a lot of back-and-forth since the RFC, so having
> it land with your Tested-by means a lot.
> 
> I'll prepare the follow-ups as separate patches once this series is in:
> 
> - The video_device lifetime issue on the V4L2 side (the devm-allocated
>   struct with video_device_release_empty that the automated review
>   flagged) -- as a standalone fix for the existing driver, since it's
>   independent of the audio support.
> - An atomicity fix for the GLOBAL_SWENABLE read-modify-write, now that
>   the audio path adds a second writer to that register alongside the
>   CEC code.
> 
> The repeated-suspend wedge I mentioned in the cover letter I'd rather
> send only once I have a clean, reproducible trigger for it -- it's
> still under investigation and I don't want to send a fix ahead of a
> solid repro.
> 
> The dynamic codec registration you suggested (bind on the plug event,
> read the actual wire sample rate and restrict the codec's rate) is the
> direction I'd like to explore after these, once I've looked at what it
> needs from hdmi_codec_ops.

Good plan

RE the sample rate restriction, hdmi_codec_ops has get_eld() that
restricts rate based on HDMI ELD [1]. For RX we could tell the exact
rate to CODEC without ELD or we could generate ELD in the driver, either
way should require extension of CODEC driver with support of RX rate
restriction. This way userspace will see that there is only one rate
available for capture, so it won't be able to choose wrong rate and will
resample audio itself as it needs.

HDMI plug event -> signal stable -> gate audio rate from ACR -> register
CODEC device -> ops.get_eld() returns our ELD

[1]
https://elixir.bootlin.com/linux/v7.1.3/source/sound/soc/codecs/hdmi-codec.c#L477

-- 
Best regards,
Dmitry

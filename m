Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218465;
	b=CwqLFpjQaGpR4BtnDXKl4zSFU0FwwF6WcVhiwaOtkoK7hmVqndHTUsa92DgOvEaUAT6P
	 VkQBaTvyXIIKNrcEDTqLa9JCrEkmSMa0RKZUUGMdvk2d+gUbY5qZSGVJYhNgqAN/x6bcW
	 OVnZLYxTNv+4OwHYSmaIuDZEDzKpcuuH2bcelG4LWdeIfq/Yht0zhvSIPNchVete5ZpCD
	 uZx0R2aRHUTDB+Wv2G/ZiNoqPImyZj/wW0gkeujlgiL1G4p79cPCoVCbcuxidWfCPPsha
	 pi31LGp+BZVieg1cf1jd+/Wv8rYSFkR7REp20CJIYX3xfO40KIuTqf/xvWGf8TZSq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218465;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=G9jRcA3t0PbQ3IppvwiDsS68F0Mg+WyHZ1pyiCmji8A=;
	b=qHwsFAoiawgsRQoLY6WiXubW2Jk4YFWWNzq8/IVSl5AQ1xqHzNxzAU3o9Do85pSIvcKp
	 HRavftV8icf5MDqdW89YYndkJu6m+2r8Os8vR+HUtPruyipRVL3JVf5mp+vifHtpDHahp
	 eHuenvjABvIPpDfGsOneCkuOFLeuc+OrZ/vS4eT4bWJRHtfcQQz7BUd3vzy9XK7Ijly4Q
	 ZjunLts5LQENgWiBSlP7n8+C8VZmwjR22w4Ed+TG2cHR2EeGSggr4m54YOhDqMdqJWs2S
	 3QrLSGPfIeA+yB/T3XZhiyEp2xOnwOObd8RmRy4QlgIcsgEDx4AReLeEjUjGEA6lk/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RekZmOAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD3606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RekZmOAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70FC1F0089F;
	Mon,  9 Nov 2026 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218464;
	bh=G9jRcA3t0PbQ3IppvwiDsS68F0Mg+WyHZ1pyiCmji8A=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=RekZmOAy1LZ13WLetGpOwAkiaQdOc8J4RxXjJ03yEd3OeY7gJn6WA+Bk9wUU7qD+e
	 MSjw1dGDVAPY7OnhxFUzkqXf5gKdqZ6Zk6WldXkvAh+rwuaw6DD1eSTSSXhRiyQHfi
	 kHU0pDv0uUwp0m5WvhLm93HVcwGu5rpmn0uMlPpM/CFsaLhopwv4TC6NoeNjJzGZIf
	 S+ofzsYbj9vTBqQlFv8aQ54ygdnEexg1mmtLM+Lyv+P/tf5YC2sU5+oXU7ho9xxNIA
	 rc5FPf0qzdMfEyBCnJZJZVTcGY/SxHpr06jE4n047+UHxdopfGYJCxVrjjW/bWpuOQ
	 G1hHTdMpcojdQ==
Message-ID: <a64d020d-eecc-4db4-90a4-45afb9fd269e@kernel.org>
Date: Mon, 9 Nov 2026 11:01:02 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/5] rc-core fixes
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org
References: <cover.1792951808.git.sean@mess.org>
Content-Language: en-US, nl
In-Reply-To: <cover.1792951808.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2026 19:13, Sean Young wrote:
> A few random rc-core fixes and improvements.
> 
> Sean Young (5):
>   media: rc: Remove pointless msleep() after request_module()
>   media: rc: Prevent overflow in ir_raw_event_store_edge()
>   media: rc: Do not touch rx state when unregistering a tx-only device
>   media: imon: Replace pr_err() with dev_err() and friends
>   media: rc: struct rc_map should have entries and capacity

For this series:

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Thank you for patch 5/5: the new names make much more sense.

Regards,

	Hans

> 
>  drivers/media/rc/imon.c                       | 93 ++++++++-----------
>  .../media/rc/keymaps/rc-adstech-dvb-t-pci.c   |  2 +-
>  drivers/media/rc/keymaps/rc-alink-dtu-m.c     |  2 +-
>  drivers/media/rc/keymaps/rc-anysee.c          |  2 +-
>  drivers/media/rc/keymaps/rc-apac-viewcomp.c   |  2 +-
>  .../media/rc/keymaps/rc-astrometa-t2hybrid.c  |  2 +-
>  drivers/media/rc/keymaps/rc-asus-pc39.c       |  2 +-
>  drivers/media/rc/keymaps/rc-asus-ps3-100.c    |  2 +-
>  .../rc/keymaps/rc-ati-tv-wonder-hd-600.c      |  2 +-
>  drivers/media/rc/keymaps/rc-ati-x10.c         |  2 +-
>  drivers/media/rc/keymaps/rc-avermedia-a16d.c  |  2 +-
>  .../media/rc/keymaps/rc-avermedia-cardbus.c   |  2 +-
>  drivers/media/rc/keymaps/rc-avermedia-dvbt.c  |  2 +-
>  drivers/media/rc/keymaps/rc-avermedia-m135a.c |  2 +-
>  .../rc/keymaps/rc-avermedia-m733a-rm-k6.c     |  2 +-
>  drivers/media/rc/keymaps/rc-avermedia-rm-ks.c |  2 +-
>  drivers/media/rc/keymaps/rc-avermedia.c       |  2 +-
>  drivers/media/rc/keymaps/rc-avertv-303.c      |  2 +-
>  .../media/rc/keymaps/rc-azurewave-ad-tu700.c  |  2 +-
>  drivers/media/rc/keymaps/rc-beelink-gs1.c     |  2 +-
>  drivers/media/rc/keymaps/rc-beelink-mxiii.c   |  2 +-
>  drivers/media/rc/keymaps/rc-behold-columbus.c |  2 +-
>  drivers/media/rc/keymaps/rc-behold.c          |  2 +-
>  drivers/media/rc/keymaps/rc-budget-ci-old.c   |  2 +-
>  drivers/media/rc/keymaps/rc-cec.c             |  2 +-
>  drivers/media/rc/keymaps/rc-cinergy-1400.c    |  2 +-
>  drivers/media/rc/keymaps/rc-cinergy.c         |  2 +-
>  drivers/media/rc/keymaps/rc-ct-90405.c        |  2 +-
>  drivers/media/rc/keymaps/rc-d680-dmb.c        |  2 +-
>  drivers/media/rc/keymaps/rc-delock-61959.c    |  2 +-
>  drivers/media/rc/keymaps/rc-dib0700-nec.c     |  2 +-
>  drivers/media/rc/keymaps/rc-dib0700-rc5.c     |  2 +-
>  .../media/rc/keymaps/rc-digitalnow-tinytwin.c |  2 +-
>  drivers/media/rc/keymaps/rc-digittrade.c      |  2 +-
>  drivers/media/rc/keymaps/rc-dm1105-nec.c      |  2 +-
>  drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c |  2 +-
>  .../media/rc/keymaps/rc-dntv-live-dvbt-pro.c  |  2 +-
>  drivers/media/rc/keymaps/rc-dreambox.c        |  2 +-
>  drivers/media/rc/keymaps/rc-dtt200u.c         |  2 +-
>  drivers/media/rc/keymaps/rc-dvbsky.c          |  2 +-
>  drivers/media/rc/keymaps/rc-dvico-mce.c       |  2 +-
>  drivers/media/rc/keymaps/rc-dvico-portable.c  |  2 +-
>  drivers/media/rc/keymaps/rc-em-terratec.c     |  2 +-
>  .../media/rc/keymaps/rc-encore-enltv-fm53.c   |  2 +-
>  drivers/media/rc/keymaps/rc-encore-enltv.c    |  2 +-
>  drivers/media/rc/keymaps/rc-encore-enltv2.c   |  2 +-
>  drivers/media/rc/keymaps/rc-evga-indtube.c    |  2 +-
>  drivers/media/rc/keymaps/rc-eztv.c            |  2 +-
>  drivers/media/rc/keymaps/rc-flydvb.c          |  2 +-
>  drivers/media/rc/keymaps/rc-flyvideo.c        |  2 +-
>  drivers/media/rc/keymaps/rc-fusionhdtv-mce.c  |  2 +-
>  drivers/media/rc/keymaps/rc-gadmei-rm008z.c   |  2 +-
>  drivers/media/rc/keymaps/rc-geekbox.c         |  2 +-
>  .../media/rc/keymaps/rc-genius-tvgo-a11mce.c  |  2 +-
>  drivers/media/rc/keymaps/rc-gotview7135.c     |  2 +-
>  drivers/media/rc/keymaps/rc-hauppauge.c       |  2 +-
>  drivers/media/rc/keymaps/rc-hisi-poplar.c     |  2 +-
>  drivers/media/rc/keymaps/rc-hisi-tv-demo.c    |  2 +-
>  drivers/media/rc/keymaps/rc-imon-mce.c        |  2 +-
>  drivers/media/rc/keymaps/rc-imon-pad.c        |  2 +-
>  drivers/media/rc/keymaps/rc-imon-rsc.c        |  2 +-
>  drivers/media/rc/keymaps/rc-iodata-bctv7e.c   |  2 +-
>  drivers/media/rc/keymaps/rc-it913x-v1.c       |  2 +-
>  drivers/media/rc/keymaps/rc-it913x-v2.c       |  2 +-
>  drivers/media/rc/keymaps/rc-kaiomy.c          |  2 +-
>  drivers/media/rc/keymaps/rc-khadas.c          |  2 +-
>  drivers/media/rc/keymaps/rc-khamsin.c         |  2 +-
>  drivers/media/rc/keymaps/rc-kworld-315u.c     |  2 +-
>  drivers/media/rc/keymaps/rc-kworld-pc150u.c   |  2 +-
>  .../rc/keymaps/rc-kworld-plus-tv-analog.c     |  2 +-
>  .../media/rc/keymaps/rc-leadtek-y04g0051.c    |  2 +-
>  drivers/media/rc/keymaps/rc-lme2510.c         |  2 +-
>  drivers/media/rc/keymaps/rc-manli.c           |  2 +-
>  drivers/media/rc/keymaps/rc-mecool-kii-pro.c  |  2 +-
>  drivers/media/rc/keymaps/rc-mecool-kiii-pro.c |  2 +-
>  .../rc/keymaps/rc-medion-x10-digitainer.c     |  2 +-
>  drivers/media/rc/keymaps/rc-medion-x10-or2x.c |  2 +-
>  drivers/media/rc/keymaps/rc-medion-x10.c      |  2 +-
>  drivers/media/rc/keymaps/rc-minix-neo.c       |  2 +-
>  drivers/media/rc/keymaps/rc-msi-digivox-ii.c  |  2 +-
>  drivers/media/rc/keymaps/rc-msi-digivox-iii.c |  2 +-
>  .../media/rc/keymaps/rc-msi-tvanywhere-plus.c |  2 +-
>  drivers/media/rc/keymaps/rc-msi-tvanywhere.c  |  2 +-
>  drivers/media/rc/keymaps/rc-mygica-utv3.c     |  2 +-
>  drivers/media/rc/keymaps/rc-nebula.c          |  2 +-
>  .../rc/keymaps/rc-nec-terratec-cinergy-xs.c   |  2 +-
>  drivers/media/rc/keymaps/rc-norwood.c         |  2 +-
>  drivers/media/rc/keymaps/rc-npgtech.c         |  2 +-
>  drivers/media/rc/keymaps/rc-odroid.c          |  2 +-
>  drivers/media/rc/keymaps/rc-pctv-sedna.c      |  2 +-
>  drivers/media/rc/keymaps/rc-pine64.c          |  2 +-
>  drivers/media/rc/keymaps/rc-pinnacle-color.c  |  2 +-
>  drivers/media/rc/keymaps/rc-pinnacle-grey.c   |  2 +-
>  .../media/rc/keymaps/rc-pinnacle-pctv-hd.c    |  2 +-
>  drivers/media/rc/keymaps/rc-pixelview-002t.c  |  2 +-
>  drivers/media/rc/keymaps/rc-pixelview-mk12.c  |  2 +-
>  drivers/media/rc/keymaps/rc-pixelview-new.c   |  2 +-
>  drivers/media/rc/keymaps/rc-pixelview.c       |  2 +-
>  .../rc/keymaps/rc-powercolor-real-angel.c     |  2 +-
>  drivers/media/rc/keymaps/rc-proteus-2309.c    |  2 +-
>  drivers/media/rc/keymaps/rc-purpletv.c        |  2 +-
>  drivers/media/rc/keymaps/rc-pv951.c           |  2 +-
>  drivers/media/rc/keymaps/rc-rc6-mce.c         |  2 +-
>  .../rc/keymaps/rc-real-audio-220-32-keys.c    |  2 +-
>  drivers/media/rc/keymaps/rc-reddo.c           |  2 +-
>  .../rc/keymaps/rc-siemens-gigaset-rc20.c      |  2 +-
>  .../media/rc/keymaps/rc-snapstream-firefly.c  |  2 +-
>  drivers/media/rc/keymaps/rc-streamzap.c       |  2 +-
>  drivers/media/rc/keymaps/rc-su3000.c          |  2 +-
>  drivers/media/rc/keymaps/rc-tanix-tx3mini.c   |  2 +-
>  drivers/media/rc/keymaps/rc-tanix-tx5max.c    |  2 +-
>  drivers/media/rc/keymaps/rc-tbs-nec.c         |  2 +-
>  drivers/media/rc/keymaps/rc-technisat-ts35.c  |  2 +-
>  drivers/media/rc/keymaps/rc-technisat-usb2.c  |  2 +-
>  .../rc/keymaps/rc-terratec-cinergy-c-pci.c    |  2 +-
>  .../rc/keymaps/rc-terratec-cinergy-s2-hd.c    |  2 +-
>  .../media/rc/keymaps/rc-terratec-cinergy-xs.c |  2 +-
>  drivers/media/rc/keymaps/rc-terratec-slim-2.c |  2 +-
>  drivers/media/rc/keymaps/rc-terratec-slim.c   |  2 +-
>  drivers/media/rc/keymaps/rc-tevii-nec.c       |  2 +-
>  drivers/media/rc/keymaps/rc-tivo.c            |  2 +-
>  .../rc/keymaps/rc-total-media-in-hand-02.c    |  2 +-
>  .../media/rc/keymaps/rc-total-media-in-hand.c |  2 +-
>  drivers/media/rc/keymaps/rc-trekstor.c        |  2 +-
>  drivers/media/rc/keymaps/rc-tt-1500.c         |  2 +-
>  .../media/rc/keymaps/rc-twinhan-dtv-cab-ci.c  |  2 +-
>  drivers/media/rc/keymaps/rc-twinhan1027.c     |  2 +-
>  drivers/media/rc/keymaps/rc-vega-s9x.c        |  2 +-
>  drivers/media/rc/keymaps/rc-videomate-k100.c  |  2 +-
>  drivers/media/rc/keymaps/rc-videomate-s350.c  |  2 +-
>  .../media/rc/keymaps/rc-videomate-tv-pvr.c    |  2 +-
>  .../media/rc/keymaps/rc-videostrong-kii-pro.c |  2 +-
>  drivers/media/rc/keymaps/rc-wetek-hub.c       |  2 +-
>  drivers/media/rc/keymaps/rc-wetek-play2.c     |  2 +-
>  .../rc/keymaps/rc-winfast-usbii-deluxe.c      |  2 +-
>  drivers/media/rc/keymaps/rc-winfast.c         |  2 +-
>  drivers/media/rc/keymaps/rc-x96max.c          |  2 +-
>  drivers/media/rc/keymaps/rc-xbox-360.c        |  2 +-
>  drivers/media/rc/keymaps/rc-xbox-dvd.c        |  2 +-
>  drivers/media/rc/keymaps/rc-zx-irdec.c        |  2 +-
>  drivers/media/rc/rc-ir-raw.c                  |  3 +-
>  drivers/media/rc/rc-main.c                    | 92 +++++++++---------
>  include/media/rc-map.h                        |  8 +-
>  143 files changed, 230 insertions(+), 244 deletions(-)
> 


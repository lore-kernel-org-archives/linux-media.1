Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CD345ED9;
	Thu, 23 Jul 2026 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840196; cv=pass; b=g32x9W+tMU1A2vjCNd2II2NnjRWVw45E6skForoHNcRX4oa/XLlIejL0KmKqRJD40qT1MMfVwU+/FI/lamXXXVEKGpPQshwMsZko/5WBvVP62mxrWX9G2Vb32PxORO5L+NH1CkASIiPOkjgIq0DF+kiRtT5Mw+f8ASDQPoeCuBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840196; c=relaxed/simple;
	bh=ds4YAyGxUGGXS3T7kkGkgx0wApLTLcviM14ykvvKwY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBCZKVjcuoQLCcPaCebz+RSMF/GDpinUSiEcZn0Dqnv7HdlIFoUB/lDKTr5d30wZ2NKWs+NJDDYJgVlq55Kljk9FYQQ+WMbvRIwviPz6axv6Tv6ODJq77Gh9bAddZUs7xLq+x1MTE+6CA+wfRSxOPatCjeBp7DVhmC+j6MgxcoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=M+mj4sir; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="M+mj4sir"
ARC-Seal: i=1; a=rsa-sha256; t=1784840177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D9+jE3ftNDflNHtQS33dbevRLkr8wXunkO2Onj2Lu/ALSlCFoj4c/61dJdpCBiSYp4iPNhXABhUuS7YflA/qcxSuPjLHqR1+lPmGIya4dZett6ngj4pL7rymaVQ1PcRxoaXgatWY0o38gDW/DNaqVt2FmL4MSQwilBey6hKUI58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840177; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8I9WwvhFbEM9iAa53dhbxA1gFJZWlii6YXBZUb5eEow=; 
	b=ZhMp2BG2WaLBVBGgodkSC30NjhHbJ3KsVF/bY1FLG31ri8YaxXA6TECod9WY6qTBaYO9bofUE04gasDYF4xi1LJ89G7tWkqXNy4hXzTUUxmW0k/yRLb0rzjGzRuEUxoz79WaknWRB4dppASuGICKwHoaU706yudRJbcWB4JqKNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840177;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8I9WwvhFbEM9iAa53dhbxA1gFJZWlii6YXBZUb5eEow=;
	b=M+mj4sirUiKmA5b2cRUrbBUrgIrqj3ze6YoyZu5iEJApefiJ0nJ+aClAPDiKbTaf
	RezgtJvXsCx0NyK+9kMOFnrEbIBilEBehJiuPgWU/V+Kti2WURFxjHPQ00gv+HiRCe0
	cLFBysy7TYOsMxDZ/VFghjCc/x2ls9Nb04Bn5mT4=
Received: by mx.zohomail.com with SMTPS id 1784840175686843.6352557845835;
	Thu, 23 Jul 2026 13:56:15 -0700 (PDT)
Message-ID: <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
Date: Thu, 23 Jul 2026 23:56:11 +0300
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
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 08:31, Igor Paunovic wrote:
> Hi Dmitry,
> 
>> Re-arming will be best option if it works properly.
> 
> Went back to it and made it work properly -- with one honest caveat
> at the end.
> 
> Plain cancel/re-arm could not have been enough as previously
> written: hdmirx_resume() fully resets the controller via
> reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
> audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
> the worker's error path never re-programs those -- it only resyncs
> the clock rate and reinits the FIFO. So v4 does:
> 
> - suspend: cancel_delayed_work_sync() on the audio worker before
> the clocks are gated (audio_streaming stays set);
> - resume: if a capture stream is active, re-program the whole
> audio path (clock from the last known sample rate, FIFO
> thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.
> 
> The programming is factored out of hw_params() into a shared
> hdmirx_audio_setup() helper so resume and hw_params cannot drift.
> I also checked that nothing in the post-resume hotplug re-init path
> (plugout/plugin/submodule_init/controller_init) touches the audio
> bits, so the restore survives the replug dance resume triggers.
> 
> Measured on the Orange Pi 5 Plus (pm_test=devices, i.e. full device
> suspend/resume callbacks, active capture stream with live audio
> through the whole cycle): on resume the capture simply continues --
> audio was flowing again the moment the display came back, no
> userspace intervention, clean dmesg, no oops in any of the ~6
> cycles exercised tonight.
> 
> The caveat: a *second* suspend/resume cycle in the same boot leaves
> the audio datapath silent (the I2S slave sees no bit clock, so
> capture reads time out) even though the resume restore re-programs
> everything, and a fresh stream open does not recover it -- only a
> reboot does. Notably this happens with plain no-stream suspend
> cycles as well, so it is not caused by (and would not be prevented
> by) either the re-arm or the -EBUSY approach -- it looks like more
> controller state lost on repeated reset that neither hw_params nor
> resume currently covers, likely the same warm-up state machine I
> described in the v3 testing note (audio needing a video STREAMON
> after a replug). I am instrumenting the register state next to
> root-cause it; I'd treat it as a follow-up rather than a v4
> blocker, but happy to hear if you see it differently -- and curious
> whether the 5B shows the same second-cycle behavior.
> 
> v4 follows with the re-arm plus the dts and binding changes already
> mentioned.
> 
> One more small thing the audio bit exposes, for a possible
> follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
> and the write each take rst_lock separately), and with audio added
> there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
> enable racing an audio enable/disable could in theory lose the
> other side's bit. Mainline today has a single writer, so it is not
> a bug there. Can send a small patch making it atomic if you think
> it is worth it.

Feel free to send the follow ups.

-- 
Best regards,
Dmitry

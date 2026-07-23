Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B15331A41;
	Thu, 23 Jul 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784839838; cv=pass; b=hoYRyNDIE9Sgw5cDOB01/KT4oBAsggWAg6fdtoPEqtqw+kzECLxw2p8wSh05CSL5PKIHaSclPrDxWye4lmlQuEnTG1GVW1zQnpImSNDraYaUyE6+MbOSmUECwqo552pHxGE/uTLjeYQxJez+Lsf4f1ySmSmhlSIw9N3ZD8VrhbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784839838; c=relaxed/simple;
	bh=ICt/tD25Ze3r2HkN9crTAvXUH5mqmr/lVshZeyv99+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbva8ZZoh0hOGD8I+UyYraU4cucVexh0ngGvvpTbQwUaA+XCpwxqrgC5d17PrKy0EVj5AnQwnFXeoimchRoecqyrFJMho7KMDgarF+20Mnap6l9Ul7//MksIYt27FwuRsafjN/G+e8dGZqxjDY8T+xPKOmWlgSeec21ivIYVhnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=ZiTB9pM5; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ZiTB9pM5"
ARC-Seal: i=1; a=rsa-sha256; t=1784839818; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XMG/wr4GN4vLYna9aU05B4HrXbD6HwxQ9DsJPRslUljs/9cAloicWqRSsLUMHs5c6vu5P37fi7oEWupHs6ZoJnLQIKXy7MDeFtqrjWXEB8cqe4qvOmQiA+ZyOGDl7loEJTTdk9avMJst6z9ijGF6SQTkURsLLHbqblq0DQ0Ybmc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784839818; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eM65QZLrWtYxIQiPT84qffHAidOGo3FICK3E0OXeoJo=; 
	b=OxU8crpuLIfTfXyNuVpPUMYgrK7x44YMeGPATsa5zLa8UGZujZSraMhXYXduemhlPBIa1b1ucf7jYUJ9dAASLJ2TqyBzHXmP6LD8EE73nTNRwed6pxP4NVVKNRExjgD6ProZT3trOzqIFBufjJzIcoI+Di2f81GPrvxXpVP4WP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784839818;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eM65QZLrWtYxIQiPT84qffHAidOGo3FICK3E0OXeoJo=;
	b=ZiTB9pM5t2Ueeg9IP/5bxQYmUT0C61Z3Ef+pSNXhTVr2ByZFg9PZKStLTyml4zYD
	5sS5sJq34hQ/BxWyisIwE779c1SPJ5WGLl3yjZDGEznrufd5umBTUwspcgxJ7L+5TJc
	kpXufWJPajCzKkj3z4k1y3JNtv4YHQOPxxxn75jc=
Received: by mx.zohomail.com with SMTPS id 1784839814772605.7006110620167;
	Thu, 23 Jul 2026 13:50:14 -0700 (PDT)
Message-ID: <58b7f1fd-997c-48af-9a7c-a0a5738a5d42@collabora.com>
Date: Thu, 23 Jul 2026 23:50:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture
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
 <20260721064115.64809-3-royalnet026@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260721064115.64809-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 09:41, Igor Paunovic wrote:
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller, so that a
> simple-audio-card in the device tree can bind the HDMI RX audio DAI.
> 
> The sample rate is recovered from the ACR N/CTS values together with the
> measured TMDS character rate. A periodic worker keeps the local audio
> reference clock locked to the source by nudging it in small ppm steps to
> hold the audio FIFO fill level near its target, which avoids FIFO
> under/overflow and the resulting dropped samples.
> 
> Across system suspend the worker is stopped before the controller
> clocks are gated. Resume fully resets the controller, wiping the audio
> configuration, so when a capture stream is active it re-programs the
> audio path from the last known sample rate and re-arms the worker,
> whose rate change and FIFO error paths resynchronize once the source
> delivers audio again.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v4:
> - use swab32() for the ACR word reversal: readl() already abstracts
>   bus endianness, so the reversal must be unconditional (be32_to_cpu
>   is a no-op on big-endian)
> - support system suspend: stop the worker in suspend before the
>   clocks are gated; resume fully resets the controller, so re-program
>   the audio path and re-arm the worker while a capture stream is
>   active, through a hdmirx_audio_setup() helper shared with
>   hw_params() (Dmitry Osipenko; validated with an active capture
>   stream across suspend/resume)
> 
> Changes in v3:
> - restore the v1 audio teardown in remove(): audio_shutdown() already
>   stops the worker when the stream closes, so the extra flag clear
>   and trailing cancel added in v2 were redundant (Dmitry Osipenko)
> - rename the ACR read locals and add a comment documenting the
>   register byte packing
> - drop the get_dai_id stub so OF-graph cards resolve the DAI index
>   from the reg property
> 
> Changes in v2:
> - register the S/PDIF DAI so the indexes match the binding and reject
>   it with -EOPNOTSUPP until wired up (Sebastian Reichel)
> - use platform_device_register_data() and drop the fixed 32-bit DMA
>   mask (Dmitry Osipenko)
> - don't leave an ERR_PTR in audio_pdev on registration failure
> - fix teardown ordering in remove()
> - stop the worker before reprogramming shared state in hw_params()
> - look up the "audio" clock by name instead of indexing clks[1]
> - keep the worker on system_unbound_wq when re-arming
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 306 ++++++++++++++++++
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
>  2 files changed, 314 insertions(+)

Note: Current variant of audio support requires userspace to manually
select appropriate audio freq on capture. This needs to be improved
later on for regular userspace apps by dynamically registering audio
CODEC on HDMI cable plug event and reading out actual audio freq on the
wire, restricting the CODEC's rate, which might require extension of the
hdmi_codec_ops.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

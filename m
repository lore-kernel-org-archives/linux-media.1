Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354458;
	b=voIUAx7PDqDM1usqE0Z4a8yu9M/qkFdW4BQ4ANVHy506dPvzSP8P6jiI/LMsKaIo16Z/
	 6qFYzjpY0oUf00uUG6mdqLXXxRZgNblWGIoiYSgu6fF3rTXRq1cmuJM1Ygnl9VrPG8z46
	 LQMgLztKe7sCMpmsh2ArxooHQNGVCE0wCPZm7+lDiPVM3s5HJP4TqTCFU71jqffSVbz9o
	 Oiy1FhSV+FeX1XR27i7YWefut2Uzlwzltgbr2LVSmFKs2Q4cmctI6m/kBe7cjdysmnjdK
	 /OnZ8WvxlrsprbjxDxcr48FKZ/DmrvbkAaJBfbFhoiD46EHyaH+giS/QcWxt8ueAhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354458;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:References:
	 In-Reply-To;
	bh=HMMC0LB5IhYegJWToan1YqcEUtKAc3112EBRFHGcsc8=;
	b=pyQfW1ZcU2kqXka6ib0wjaCy5WWM8Uxmt7iKpGoWafPzJvNZdqeBgHbwtoZF14Q1Fnax
	 I93sbeGOUjcXSod9JRqFIVDtM0sAWVmTqp2o6u0OzqUE78qokxA+BldufKPx4CVfdKSLZ
	 TiToVS/LVmlOUnWhW/ljwzKnjjedWV7b0zDLtBKpI9xHX6dTb80c7L8t5TMxyc2nsxtB0
	 Y4PaSalSOlhBVYxUfKxdbqz8McKMqlX1MOIO9zPWwiHSgENp/ECJymPCBrjDEGX/Fh14o
	 /w69xnfHg8g2/ckCdd3fMS3HzPxuEVNYv1rsYxl6K1CQIMWOYISocmZCYg6jZjM5MEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b="dM857/fu";
	arc=none smtp.remote-ip=95.215.58.216
Received: from mta1.migadu.com (out-216.mta1.migadu.com [95.215.58.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4675606A337
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4675606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=dM857/fu
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hFEdDqcg2ZlHkL5dY5J1x4B25r/X63b0yKh+YIcEB7A=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795354454; v=1; x=1795959254;
 b=dM857/fuS3J9FM3yaYV3If+rrr3xntoEZlPeYVNoNZH6mji5DEIeqNPMvEcpwaNdRFbf1vxb
 HyJWDPSCZsa0WfpVwiP/3muYzhaoq/kFSky8jwxba+SGW0bRkn8tgAHYgR2YyUu6LTG8iVsr7Zl
 +9Zc2LPSCiCRcwPGQsM0XJ8+1mc7HrpYDGHu/rWTd54mV3+fk9DqYuZ4yQEGc3tiohYhT3rrbue
 rgroDhkv1/XaKKbHxgWA2z+I7nIt3cn49yISUhkem+4z6kutvx7KnYdJ26o4YrjvcDfBRXgSBzS
 on7SqQBV8Rx8VGpv5sVoRoLZhDA78FU48MPQtfOcmxa2w==
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5d2907f0ba893942;
	Sun, 22 Nov 2026 13:34:14 +0000
X-Mizu-Trace-ID: 5d2907f0ba893942
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 14:34:12 +0100
Message-Id: <DN1S1D7FIF6B.2WHLNV11LRJ6B@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Dang
 Huynh" <dang.huynh@mainlining.org>, "Piotr Oniszczuk"
 <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
 <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>
In-Reply-To: <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>

On Fri Nov 20, 2026 at 9:16 PM CET, Diederik de Haas wrote:
> On Fri Nov 20, 2026 at 6:36 PM CET, Daniel Golle wrote:
>> This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
>> rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
>> ...
>> Known limits, none of them introduced here:
>>
>> - FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
>>   and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
>>   on this decoder as on the VDPU381 ("Long and short term RPS not
>>   set"). The handling of these controls is also the subject of [6].
>
> FWIW and IIUC, Detlev has a patch for that here:
> https://gitlab.collabora.com/detlev/ffmpeg/-/commits/v4l2-request-ext-sps=
-rps-n8.1

FWIW, I submitted and made a minor update to that patch here:
https://github.com/LibreELEC/LibreELEC.tv/pull/11686

which updates the comment that kernel 7.1+ is needed for those controls=20
and added the EXT_SPS_ST_RPS and EXT_SPS_LT_RPS split with 64 and 32.

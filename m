Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205815;
	b=C19bJsGA5tQ6D6nqWx+0U2LN4shJbCK1OT7T1k69JBreDdEteo7lWtJ3mWYXQ3+0zjOJ
	 JioNV1ItTga8deAWSI51iw4IU03kzXwqvJgt2sv1TjjR28FFJrhtz6bsnT16Oc6IaDmCx
	 87vmZBlbkewu+HeCMC3Uzw9AzUxBrlniRJuZMcVfKsB0rAy92h7ZOwI6y1bGhM5KPReIM
	 V8+ZLIHDwbX5u0RQuczghE64o7fzSrk6pJcYIy2E95NlEwiJQt4S1SsX9HkD4g5CCqH7S
	 JLl1IuzGclqupCve0jjgflIuqsHZmCX1SuKhvfLn7DRHaXnwYSv1xUldWmxNsWGWktw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205815;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To;
	bh=peNVHXoBFHgWsZZFgBktm0IIgj0OlxkuPlY62feLM9s=;
	b=1+WyP0+me06k9pWw5LCqHpd1192Kqge8Pui3MJoNYM2ybIWA6pnysZgioeRilZ/Cq4L7
	 yOZUygM4vC4GmZRgRUVx2ADZJavYsa8fl+RZn1MC31cqBlSc2xAx6Llaf3ebYpNb/rwhg
	 VUe6u73cDli35s1KBqIlg9Ru2A0pHleBaacDUnVbbTDGo7PBg7GMQrRTUe9e7S/RNK0zR
	 nJN2l5FDgB0nkN/4wNtgWcBQNTWNUTOoXDh5piYvEKSrDO5i9pPUSLfmu9Uyf8ypILBMj
	 iLck9yHFYeKwdQQx/51gv616OFA79ZorPQxUXn2cTclbGipzr3ptk9+wKnErpHnSu/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=gKHowIYZ;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E04606A6C3
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E04606A6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=gKHowIYZ
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oCLNHmGkPtVaSdKOgJfSe9v1erehhFj7NdQ3Eg5hEtA=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795205810; v=1; x=1795810610;
 b=gKHowIYZCh6xFbfA3OQTaIxtY2Pm/e4nbwUKMbvrYX0yi9YQf3Oe5dbYk96M2L0oQkrQnRY2
 PiqomfO0JyG0qeJf9ciquCMsSVsgwFPZ8l867UyV0aJeVfiwqp1NFs8VtS3qPBf255OjnHzVPaE
 MpKmK7Q1/U18XDdOC4hkjghkkkBWhm0hRHHpgIoG9dn8G/cbxxLQNoxOOMNeUVEIgkIYHQQSE0C
 Iuh9bjrBYIu1ArwgheRJplKSlevturS39+Ccnlg+2OWB+spRk1FOcESvaGpk1p8xhdyZyy9hmyZ
 6iZy+fhsNzRkp5bYDX4sn7S5REXF12IehtteaUw/jk+jQ==
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8603c6dc317910df;
	Fri, 20 Nov 2026 20:16:50 +0000
X-Mizu-Trace-ID: 8603c6dc317910df
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
Date: Fri, 20 Nov 2026 21:16:42 +0100
Message-Id: <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Diederik
 de Haas" <diederik@cknow-tech.com>, "Dang Huynh"
 <dang.huynh@mainlining.org>, "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
In-Reply-To: <cover.1795191822.git.daniel@makrotopia.org>

On Fri Nov 20, 2026 at 6:36 PM CET, Daniel Golle wrote:
> This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
> rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
> ...
> Known limits, none of them introduced here:
>
> - FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
>   and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
>   on this decoder as on the VDPU381 ("Long and short term RPS not
>   set"). The handling of these controls is also the subject of [6].

FWIW and IIUC, Detlev has a patch for that here:
https://gitlab.collabora.com/detlev/ffmpeg/-/commits/v4l2-request-ext-sps-r=
ps-n8.1



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181B39151A
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060502; cv=none; b=Gq4D/13LGM5L/pE6iZJSH9DcLGMjQL1WM4TJa640/G4nkiqXZhDyZ+I51tqWCHrjatSf/KSpTBE0RrPeYY5coTl+OnC7G2053PaNgkGOmgJ4iYyl/vbrpC6bgjXLKIRhODzNnplsn+VAn8HF0cgEh7OSWolgbbPI6I70Vzx6DXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060502; c=relaxed/simple;
	bh=ofn5hkHME0ET47suEf01SXRDspQw0iBLufrfVZYdFik=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sUjNWMT+pnnxHWzCmVYaixu4dNIvmKEtciXPAeejzt2Ain1BCct+e9q89opSQ0qefnbB5JgUtkBCTxQoERpwhMT+Rc/aS6NIyaEzE0sd1EC9XuyrD5pF6VOSwXBtrzVuy+cDQ+c7N/zzKeR2+x3RRXSfcI21w/og4IvXk+YuJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAhEpX0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAhEpX0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AF5C116C6;
	Mon, 13 Apr 2026 06:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776060501;
	bh=ofn5hkHME0ET47suEf01SXRDspQw0iBLufrfVZYdFik=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=qAhEpX0s9gBFDAasOHp6N6vrY76qU++qYOFG/Xm53KL4GFXWjoLAU01x6siuc9DUy
	 PcKnQTFamiq2t6xvM5n7hofrFdbi447Noyhd40q5KzbvVfLqqXvHd8ASaNAc+hZJYI
	 S6aBFuUhLIYmN1UNBgumln0M8MaecUfW9nucAVLj737eOu77AxSqnnXi4g78NJqvoc
	 Y8lFGhGJx5UFNZ9CzdraVeHb9kzdUwiQAjQd06/f7+tWtMMW5hDCFgB0ElTwMlO7BO
	 8Op2pMSD6zz0EiP2nCHYUgYCcoXMvDOYgNK7CsgVy5QMnXbr4l9kCDDamHS9H7vVp4
	 xaJveshB2FyBQ==
Message-ID: <50d90c65-1c0d-4179-824c-a63d4d6336ac@kernel.org>
Date: Mon, 13 Apr 2026 08:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa
 <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Brandon Brnich <b-brnich@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Michael Riesch <michael.riesch@collabora.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar"
 <b-padhi@ti.com>, "Donadkar, Rishikesh" <r-donadkar@ti.com>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
 <adukkATODDw7CNHY@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <adukkATODDw7CNHY@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2026 15:56, Sakari Ailus wrote:
> Title: Common raw sensor model, streams, metadata and metadata series status
> Presenter: Sakari Ailus
> Time estimate: 45 minutes (depends heavily on how much there will be
> discussion)
> Descriptition: The Common Raw Sensor Model defines a new UAPI for camera
> sensors in Linux. It provides a more useful UAPI for configuring camera
> sensors than the existing practice is. The metadata series includes the
> Common Raw Sensor Model and a number of other improvements, such as generic
> raw formats, metadata support and finally enabling the streams UAPI.

Added!

	Hans

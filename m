Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619335;
	b=GKNSwMlsQoc3ZGK4KtnIhDLN2FCe0BpHbOv0N5hbFyrvGOasfPTwH3h7YKCJe+1qQyoH
	 eXmi1a++tl12CLPK+oz8Im68vJgT/G/t9wRxDQ3c9b5unQXJ4f5wd/RJt9Z44OLjHm8ZG
	 QHSBlm5jTVBZG375GloygpNItXi2g0vqodGLeXd34fTu7jQ68VWBdQ7qY66voNHiaP74S
	 pU/F0QrE3XcKvYbD9fNZxusI17yxRpIasoCPmTri16EGEadbCABAzXd6QpifHAN4eXEIJ
	 rpDqUillVEC75+Sqen0+8BuPeVTjitbt5bZMy3WhWmjrNmHiiJo5eGFGZnFFUNsGcKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619335;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LvgjPvk8DeOlK91/Sosy4546ele2H/cHuJLoH1Ls35Y=;
	b=MNX5R0Ri+H/mnK5HVdTrHACf3bL2kisHnRJtFd6mgCr5ZeoLs5mZ3gYjYKFbQ0ZVyOSR
	 SLmRjTUAH1W7FGF62ipt+bcSaN7ovh0ZEr4Kkq6L9vuc7z2vNNy/CmKyY707MmKEvRyy9
	 f5TJrkZvldiNvfmrpOP9pEGz7SFhQCoMHVafSY2mI4I3fUlB+yMQoE+Jv4CCCbm23iJDD
	 244XzBkdriuzhn+xwuBVXD5ELUD0immhutKA2zCSBilhB1piAofxHvDPK3/6cCkCCCmEL
	 g9DANODm2Xr42mmgHlklQNlVNnb7QLx0KyjllN6tN9wWRZUVaYGbCsOwVMEfCAfl3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcqH3MIv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F578606A33D;
	Wed, 25 Nov 2026 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HcqH3MIv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71EA1F000CA;
	Wed, 25 Nov 2026 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619335;
	bh=LvgjPvk8DeOlK91/Sosy4546ele2H/cHuJLoH1Ls35Y=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HcqH3MIvICwcckfWjaghuojxvt5GH/LPUozkye8C/Yo7kgcFMOwHyqR7sXQ5CTWvF
	 hhwqlZ25IC9v2tk5ulhkqkJm6I018I7XREEdcrIWbKfriLQUd4Ns4ZZhFIBDBNP2uq
	 Wv2iPOw9d4W9uYTmZV0/A6qd5CKyxXNbiQOF2Maatb8pdvm2YxX/+5weIvHaqSowSj
	 H4vJxbWODg9ZCRmMwOVjs64N8BYZFkM5v11oO7QbCrHq6kyb2C3dXLEw8EdgqZYkap
	 D2KbP4SUHYCe7yLdD6xTeIV2oE5QCADg1ip7U4Tepxw98HRfuyyGIUDGwaWufAa8G2
	 kwDn9oFzSJiRw==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/6] media: qcom: camss: Take the link frequency
 from the CSI-2 transmitter
From: bod@kernel.org
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ravi@ebytelogic.com
In-Reply-To: <20260928121508.1404808-6-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
 <20260928121508.1404808-6-hitesh@ebytelogic.com>
Date: Wed, 25 Nov 2026 15:08:50 +0000
Message-Id: <179561933001.462348.7400383859710438706.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165; i=bod@kernel.org;
 h=from:subject:message-id; bh=Nt58v8O8xLAfhZwvg0hfnojmA4HCD154a8myCxoqgvI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrBvoC54oZwXDhJDhh3DoAK8FnSjrqjj1myGrBj
 LzE0nai5CaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawb6AgAKCRAicTuzoY3I
 OhUUD/9G+VNI2Bp4Cs5SkY6DGMLTz9kMgNZWjeql86oLiK0CFyADEjqRUeiCORpsYFNctV3473T
 yTPMRo99I0KIBScH7biT9sRUytWJRoJYYHGVfADHW0yMwCTjUIPdlN+tf1Wf45861UfFmsil4Wm
 Lo+Mor60xxA4GusLLk6E3TBK6h3qYGrRQyTQRQ5PE+UK5oQwz+1e5nrGfqLxtALl3XmkTsgstMf
 /MNk9gUWPFeh67E1DanbszFiyEKolvbOUwGvKRUukOuR62EZHeFXgIC368UzbvUDdDKjtGtBY9f
 YLg/Jz/CpfYsAoA/9jv53MkZuTDVZ4dCH1g3tGuuou9onWRcyWreEJXXLh8Vckjg9pxCNIxFoPy
 rFE/+l2x/frSnlAtkV81xHADwXuXcFSHNM6A1EP/VSaTv/kyuXsGoCCojKY9s1WxOgbu1jmhL57
 fXoOMcecAXbE/Efi2+KrDbefKUX4iiIviMcNwyKOqyuVDkkp60hrpd9MHAnzDeQ8acIlYel3NTf
 4TExbCGQ1gxxDR4om3ZhGAcdH5VVQaLOqqb9EcoAsx+qyCrlXnz+289bkC1Z5q6N0+Gb38VHBT9
 RNsoSwexPpate+fUiTlkgM3KOCVMacXWhmxBV1/vffVyxt2VNuUrmsdRHMWRteyjn43P0hypDkY
 Xjd402ABYuP/Zow==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-28 17:45 +0530, Hitesh Patel wrote:
> camss_get_link_freq() walks the pipeline up to an entity with the
> MEDIA_ENT_F_CAM_SENSOR function and reads the link frequency there.
> The CSIPHY settle count and the CSID clock are then derived from it.
> 
> The frequency the receiver has to be programmed for is the one on the
> CSI-2 bus, which belongs to whatever drives that bus. When the sensor
> is wired straight to the CSIPHY that is the sensor, and the walk gives
> the right answer. When a CSI-2 to CSI-2 bridge sits in between, such
> as a GMSL or FPD-Link deserializer, the bridge re-times the data onto
> its own output at its own rate: it may aggregate several sensors onto
> one link, forward one sensor at a different rate, or generate a test
> pattern with no sensor at all. The sensor's rate is then not what
> arrives at the SoC, and the CSIPHY does not lock.
> 
> The walk can also fail before reaching a sensor. A deserializer has
> one sink pad per serial link and the walk always follows pad 0; a
> sensor attached to any other link is never found and streaming is
> refused with "Cannot get CSI2 transmitter's link frequency".
> 
> Add camss_find_transmitter_pad(), which stops at the first entity that
> is not a CAMSS receiver, i.e. at the external subdev feeding the
> CSIPHY, and ask that pad with v4l2_get_link_freq(). The helper queries
> the transmitter through .get_mbus_config first and falls back to its
> V4L2_CID_LINK_FREQ and V4L2_CID_PIXEL_RATE controls, so a bridge and a
> bare sensor are both handled by the standard mechanism.
> 
> camss_get_pixel_clock() reads V4L2_CID_PIXEL_RATE and describes the
> same bus, so it uses the transmitter pad as well. For a sensor
> connected directly to a CSIPHY the transmitter is the sensor, so
> neither the pad found nor the value returned changes.
> 
> camss_find_sensor_pad() stays for the frame skip query in the gen1 VFE,
> which is a genuine sensor operation and whose result that VFE does
> program into the hardware.

This commit log is a wall of text. Please whittle it down to a few
scrutable statements.

The code is straight forward so a commit log as verbose as this smells of
AI gen. It's filler when what is required is information.

> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 80 +++++++++++++++++++----
>  1 file changed, 69 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a1..79facd0133 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4619,28 +4619,86 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>  	}
>  }
>  
> +/*
> + * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 receiver
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + *
> + * Return true for a CSIPHY or CSID belonging to @camss, false for anything
> + * else, in particular for the external subdev transmitting to them.
> + */
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +				     struct v4l2_subdev *sd)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < camss->res->csiphy_num; i++)
> +		if (sd == &camss->csiphy[i].subdev)
> +			return true;

TPG should be included in this disjunction list.

> +	for (i = 0; i < camss->res->csid_num; i++)
> +		if (sd == &camss->csid[i].subdev)
> +			return true;
> +
> +	return false;
> +}
> +
> +/*
> + * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
> + * @entity: Media entity in the current pipeline
> + *
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and return the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.

This text really reads weirdly - looks like LLMese.

"Walk the pipeline of CAMSS subdevices. Return the source-pad of the first
entity that is not a CAMSS subdevice. That entity will be the CSI-2
trasmitter driving the CSI decoder."
---
bod


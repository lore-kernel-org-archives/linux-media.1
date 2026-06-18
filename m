Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD043019A9;
	Thu, 18 Jun 2026 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799225; cv=none; b=FKnIgQiuRNXi9bpSo6aac+94hC4DcvDCoWciNELRAs8HxZVto62IVxtkKtdMlimUvnWt0AooB+FuSWVoed6cNh5u9KhsWUwVutvV+aNgmf3BfpN0pwbW+z3JmYMEIchdq6C4IeWgtNgN4qk2UpDkeQuAPqu8U4dXjsmw4v2zUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799225; c=relaxed/simple;
	bh=lItjWW11zxqs1KGyqED566ZFOB6SK9KDPXkew/KKm7s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mpTwFuCIiWV/Bobh2jM+w1/5LELvEuD0TX8N94WxViHBTESBDgv5hHUtLN+q6960x9kBj4YBTcUp9o2QMbJYRbQ/l8vnYB0ckgOefK/5R6J/qkBWsMko+Dyn+tRYAbiTVnWWwik5pGeYaaxUCH1xzvuKYrvWAQIL13oJUfgtEyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HAayLFgE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HAayLFgE"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BF608E0;
	Thu, 18 Jun 2026 18:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781799186;
	bh=lItjWW11zxqs1KGyqED566ZFOB6SK9KDPXkew/KKm7s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HAayLFgEqJc94QMUxH61juKC7+uYjGLIxF8+9GG59ZgpNMswhIBigTcpF/p8dZkKb
	 ywFpqCVO/Gd0jzP5pR9eSsZnnNMxCHFP2tXQ4s8XSc/8ITvz9qwxCBdgosZ+dqyHbR
	 nOCJFPBHiSTRzMuMTJeMZuD5WHIaGC2BYgwkFHBM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618-ov08d10-fixes-v1-1-d090ce2abe8c@emfend.at>
References: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at> <20260618-ov08d10-fixes-v1-1-d090ce2abe8c@emfend.at>
Subject: Re: [PATCH 1/2] media: i2c: ov08d10: unconditionally use the startup delay
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 18 Jun 2026 17:13:38 +0100
Message-ID: <178179921887.861173.158444882721737204@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Matthias Fend (2026-06-18 10:31:12)
> Even though the datasheet does not describe the timings for operation
> without a dedicated hardware reset, it seems sensible to wait for the
> "XSHUTDN pull up to SCCB start" time even if no reset line is available.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/ov08d10.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index 9adef5446a61f3204fb809ca3f077c1afb5f7a47..cb7e55b168781dfeaae553734=
d24208a374fce9c 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -1358,11 +1358,11 @@ static int ov08d10_power_on(struct device *dev)
>                 fsleep(5 * USEC_PER_MSEC);
> =20
>                 reset_control_deassert(ov08d10->reset);
> -
> -               /* Delay from XSHUTDN pull up to SCCB start: 8ms */
> -               fsleep(8 * USEC_PER_MSEC);
>         }
> =20
> +       /* Delay from XSHUTDN pull up to SCCB start: 8ms */

8 ms seems like a long delay at startup... but it was preceeding this
patch anyway.

If there's no hardware reset line, then I'd expect the module to have
tied that in - so I expect the delay is still required too.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> +       fsleep(8 * USEC_PER_MSEC);
> +
>         return 0;
>  }
> =20
>=20
> --=20
> 2.34.1
>

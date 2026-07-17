Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7439A4C4;
	Fri, 17 Jul 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294225; cv=none; b=hTzB2hvxYjaZhv880+HjvJExCDQUDItuLg+suJqrqbVAp7M5RpfI45Il7Jjy1FKXlkRSqFtE6pJ+2NFsc1PmOZE2erBhO9/QCcqIy3XO7NLsT263SNOdL3hHG5iL1kD2ZlYWBRJekYFLlgxBOVGUR2PibcVjZ6BnRalU/FgH4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294225; c=relaxed/simple;
	bh=ff9sRYcpHiO+uv6mHmMoeJE9Vx/51t1d7040itqRgf4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZCKazEH+MlCbqRlDj8qZwnAT+qQi1iM0OofWuhF9k5MtKTVggYIRHfbwUlpOlY3rMfPHZsLJD9g9mOzPNVW1wOIaInp+ZB6o9TKM7SsV+PkUVAt+WRHCn9OjXER/MU/R45/ec4YLYk3Ar85V8ILwH34wHhQG1gOUIi5Pg+54qSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WG261UYX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WG261UYX"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B83018FA;
	Fri, 17 Jul 2026 15:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784294166;
	bh=ff9sRYcpHiO+uv6mHmMoeJE9Vx/51t1d7040itqRgf4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WG261UYXPixjhUGhuY7a7gfmkd15LjS6jUWpUWpTDDJwuVDz56xWIfiqIQAGbRTZq
	 dYjT4hfQbYS2p9KBPL5jn/N0IzMbm7J+nhM498hsdbA9HJMRe5IRhPl1hJOHsIcUkT
	 kDCKV/J50S7nd+s0aWB0DT6kYdjMn5/U39S8hsrs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260625151756.221096-1-y-abhilashchandra@ti.com>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, r-donadkar@ti.com, devarsht@ti.com, u-kumar1@ti.com
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, jai.luthra@linux.dev, mchehab@kernel.org, mripard@kernel.org, sakari.ailus@linux.intel.com
Date: Fri, 17 Jul 2026 18:46:56 +0530
Message-ID: <178429421685.1426769.3663231526402032657@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Abhilash,

Quoting Yemike Abhilash Chandra (2026-06-25 20:47:54)
> Hi,
>=20
> This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> and cdns-csi2rx.
>=20
> Testing details: Tested on j722s-evm with v3link + IMX390 downstream driv=
er
> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad=
925e979d55a9515f89
> Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW=
12
>=20
> Jai Luthra (2):
>   media: ti: j721e-csi2rx: Support RAW12 bayer formats
>   media: cadence: csi2rx: Support RAW12 bayer formats
>=20

Thanks for the posting these, LGTM.

Sakari,=20
    could you please apply this if it looks good to you too?

Thanks,
    Jai

>  drivers/media/platform/cadence/cdns-csi2rx.c  |  4 ++++
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> --=20
> 2.34.1
>=20
>

Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B38244E052;
	Fri,  7 Aug 2026 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085769; cv=none; b=CA22Cp0SVIw+AFj+h+jSfz6IDTf9uFJTopW5nJLmy1XnX+aWQ6oZpjok+Rt42q8oE+hR2TcoQg/oK7GBXBTm5lmO9/n1cd3geJWbGSa7AHCg7HMrEE3hGzot8FXaNus1fCpvr8zjkUb4JSm6CchKxunB+TlpRVPl3+omXZqsvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085769; c=relaxed/simple;
	bh=B3XfPgDacnpoqs9t02v3Ed486405aRGbPS/RThlqlqg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hdrvsuOWjG0XnHjFk9DlEhAP5BaH1GAteDx9LahCZhGiaM+yBwRxjg0WUtqnyNUkb5qjq4PFV8QkpbjJTy7QkEu20Bsr2PV2WKjryTVT/frr8XIozPgfMfkXD71tzirUhZcphd5ecEFcxm0k2Lu9e0Zma7H0WJb9CAco9GwIoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYnIfT9x reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYnIfT9x"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:4f4:b619:ec54:a907:a006])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F0E3741;
	Fri,  7 Aug 2026 08:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786085693;
	bh=B3XfPgDacnpoqs9t02v3Ed486405aRGbPS/RThlqlqg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KYnIfT9x+yTV27/+2nYA0nbfPWx1HpPXVmPLlcX5tYR2KCSpp7aav5OFMy6AXu3S2
	 hiTsPspKeCJ3QsjSkrd9Tk7Dk5Uu3ffu1pzBow9gVyp4dbSpnldyVGqRME5ihLoVbY
	 e9JstnMswvCevmYNapm9rS16xcgvoFMWSoNx10Uw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io> <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Tarang Raval <tarang.raval@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Kate Hsuan <hpa@redhat.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, Walter Werner Schneider <contact@schnwalter.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kern
 el.org, linux-arm-msm@vger.kernel.org
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, sakari.ailus@linux.intel.com
Date: Fri, 07 Aug 2026 12:25:59 +0530
Message-ID: <178608575956.4139729.7371211848831143170@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Himanshu,

Quoting Himanshu Bhavani (2026-08-06 17:32:09)
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
>=20
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
>=20
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

It's best to keep the DT series (which go through the arm tree) separate
from the one adding the driver and bindings (which go through media tree).

Moreover, I believe DT changes can't be merged until the bindings land in
mainline (or at least the linux-next tree)

Thanks,
    Jai

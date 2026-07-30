Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE53F65EA
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408180; cv=none; b=dLr6/R6Kapv0vIA3wVjqLmMFoxuItKyntPDKB22xS+V7NIa5OKUvtujpCgDApt4bGJf5+X7UdLw0mo9zSDP/I9a+nOntdWJlCM+Sdg8Te3ir+1z2TPI1tfZM0cSptyH09PPTqwWE3OsNOop4TgAHAFMf3OOh1PTuRYLEVrCybgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408180; c=relaxed/simple;
	bh=UIReTQFYCgDo0amIVNIi23m24XsSuogH+7RXu46dvMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMQ0DXL18ezbFJfEK4oG/DzE2ur4N4gZbxMPtcPqISCx7kAiy+uJZTsu27KBdj4zcs4HoAPv51DxKR1XkRbISKz5oA+lUz68PQbS8qaE1+nsLyKHf4JLaC2Bem13BWmTI1SbAqh3puuNTcxSpxF39F+XCsDNCVxFi/edgNR3GuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkIic93l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkIic93l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408179; x=1816944179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIReTQFYCgDo0amIVNIi23m24XsSuogH+7RXu46dvMw=;
  b=UkIic93lYgsAXziv1wR7uTiopzVa96L8kPZiV1NCxEZtBymAaoJFe2EQ
   DaKuHFXjcBMWiZY7N4cfStzoOIeDRWSX9y9njnCir2F9u8VCarFLHEiNY
   OJ1nqc9O9bXhBhHcFR+zEk4z9OPQ6LpT4Pd4gsD9iroHAF1/TKpeyqPYq
   kNHbrJ6wxdGuwYXyrmsh1ekF7zBd779NrJgwkAs4GK+MWwsltqgQPIwtw
   +2ZuuPvwFf5gYBVtnPhc6fQejqFug0ToPfrixOsXxYttKLVQdokJrW+hN
   ze4UTOSTVwhaK4Rf0PM8QyOymFlg7ZkNNh1ubjd5wT8OAI89s1qqvN7Il
   g==;
X-CSE-ConnectionGUID: e5JaFVD/QbGfje9wENYsiA==
X-CSE-MsgGUID: hE+n2tVLQJqwWKFKnAOgvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89836963"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89836963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:42:58 -0700
X-CSE-ConnectionGUID: 27O21ed8SMG74AeW05qwCA==
X-CSE-MsgGUID: QQH6z8M8TqS0H6SSp7KOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="290225655"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.137])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:42:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8CC5A121C04;
	Thu, 30 Jul 2026 13:42:56 +0300 (EEST)
Date: Thu, 30 Jul 2026 13:42:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jake S <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, mchehab@kernel.org,
	ramshouriesh@gmail.com
Subject: Re: [PATCH] media: ipu-bridge: Add Himax HM1092 IR sensor
Message-ID: <amsqsB7KA_pBP0iV@kekkonen.localdomain>
References: <20260729174641.1090498-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729174641.1090498-1-j@metarealtyinc.ca>

Hi Jake,

On Wed, Jul 29, 2026 at 01:46:41PM -0400, Jake S wrote:
> From: Jake Steinman <j@metarealtyinc.ca>
> 
> The HM1092 is a 648x368 mono IR sensor used for face unlock on recent
> Intel IPU6/IPU7 laptops, sitting behind a Synaptics or Intel vision
> bridge. Without an entry here ipu-bridge builds the sensor endpoint with
> no link-frequencies property, the driver's frequency validation rejects
> every mode, and the sensor never binds.
> 
> Two frequencies are listed because the sensor is driven from different
> external clocks depending on the platform, and the PLL registers are
> programmed to match:
> 
>   0x030d (pre-divider), 0x030f (multiplier), link_freq = EXTCLK * m / p
> 
>   Dell, IPU7      EXTCLK 19.2 MHz, p=10, m=94  ->  180,480,000 Hz
>   ASUS, Qualcomm  EXTCLK 24.0 MHz, p=12, m=90  ->  180,000,000 Hz

Please avoid commas in numbers unless there are non-integer parts in them.

> 
> Both are the CSI-2 DDR clock, so the per-lane bit rate is twice the
> value, 360.96 and 360 Mbit/s respectively, over one data lane.
> 
> Worth stating explicitly because published figures for this part have
> been wrong: V4L2_CID_LINK_FREQ is the DDR clock, while the vendor mode
> descriptors publish the per-lane BIT rate. Taking the descriptor value
> verbatim gives 360,960,000, isys then configures the D-PHY for 721 Mbit/s
> against a sensor transmitting 361, the clock lane toggles, and no frame
> is ever framed. Halving it to the DDR clock is what produced the first
> captured frames from this sensor on Linux.
> 
> The two platform values differ by 0.27%, which is within what the
> sensor's PLL tolerates, but they are listed separately rather than
> merged so each platform matches exactly what its firmware programs.

Is Documentation/process/coding-assistants.rst relevant for this?

A lot of this could be on a cover letter (or after '---') but the commit
messages should be more concise than this.

> 
> Depends on the HM1092 sensor driver, currently in review.
> 
> Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -50,6 +50,8 @@
>   * Please keep the list sorted by ACPI HID.
>   */
>  static const struct ipu_sensor_config ipu_supported_sensors[] = {
> +	/* Himax HM1092 */
> +	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
>  	/* Himax HM11B1 */
>  	IPU_SENSOR_CONFIG("HIMX11B1", 1, 384000000),
>  	/* Himax HM2170 */

-- 
Regards,

Sakari Ailus

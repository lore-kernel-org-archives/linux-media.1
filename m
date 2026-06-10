Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495562E7F20;
	Wed, 10 Jun 2026 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129702; cv=none; b=ECHAZGc/iQt6ZWc7n7LutDdJm+LkYiHYKAhfvafrIu5IE39rj7/q2ap5nK1XWcKWE6an2qnDmwwiL1S/NPgOcMM+cAhoCCQhkZF1KbDYtyMXNBFmAX/BKs9xjUrr0P63ZFF4g5lb5Np3IWf0lFT2u+l74ERwsVDBDC0Lmwm3Ovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129702; c=relaxed/simple;
	bh=+wGoXEFaHcafBddGKyO6NNETIvSQ5NJvQscngG5PQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2HcIsOVntiXM1DHq579d2GILUCKrKgDd9VDOwockAvZqubVuL7Rb79nYIKkQ+p3104fh6f8q4rMbnHirnswHXNhuD1XmUbB9nn7FhhwP7fMEDWxWUGXLKHsWCYOIQ11Fk+8KpD7hYHVANQGx7/aAHEddIsp15kQ+ECN0JkHGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqf26ViI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqf26ViI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781129701; x=1812665701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+wGoXEFaHcafBddGKyO6NNETIvSQ5NJvQscngG5PQ2g=;
  b=Oqf26ViIkMJjeD9bZ0lq5so1+d0TE42uUSaV2eUZi9jsZ5h4VWun0jBv
   TPLmaTirLLlNIkenEJwqGprMlxkGJmxTGxdbtR7qtxXOVm/LQyA/s2Bbl
   23JyJwXoglDgGU18sqwglxI0CjkXSevg2uCMQ+yFwuXU3QJ8dG5t/qCVI
   CWeARY5bYiGvlG16vCYwlR8LiyhhxaleoPBEStmIfG3cEVTF9cMIT3bKG
   htXtDOF5ol99asHAG6dVsilFBxRyG5gtGxcXRQ+M1TuSpMfLjcYguLUS8
   om5NeGa6kjMgoSxcaf9LN48vEQ4DPIEeeo2y3Mz6hc1ToyHn7Re1chfAX
   Q==;
X-CSE-ConnectionGUID: OXFKjJEtQgqUAIVpwvPjEQ==
X-CSE-MsgGUID: 3/06/U6nR1C/BK1CwwST/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82129505"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82129505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:15:00 -0700
X-CSE-ConnectionGUID: ll5Q+pUfQY6WhIp7GUUGmA==
X-CSE-MsgGUID: ERb830NLTCeMKOL8cGZu8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243830221"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.102])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:14:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BACF711F8DF;
	Thu, 11 Jun 2026 01:14:54 +0300 (EEST)
Date: Thu, 11 Jun 2026 01:14:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ainh3vUs_FWj4bLR@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-4-hpa@redhat.com>
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang, Kate,

On Wed, Jun 10, 2026 at 07:11:39AM +0000, Tarang Raval wrote:
> > +       /* V4L2 controls values will be applied only when power is already up */
> > +       if (!pm_runtime_get_if_in_use(sensor->dev))
> 
> Use pm_runtime_get_if_active() or update the comment. With pm_runtime_get_if_in_use(),
> the comment should say "applied only when the device is in use".

Using pm_runtime_get_if_active() would allow more sparing I²C writes, which
I understand the driver always does in enable_streams(). It's not a bug
though.

> > +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused = {
> > +       { "SONY471A" },
> > +       { "TBE20A0" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> > +
> > +static struct i2c_driver imx471_i2c_driver = {
> > +       .driver = {
> > +               .name = "imx471",
> > +               .acpi_match_table = ACPI_PTR(imx471_acpi_ids),
> 
> Could you please add .of_match_table as well? The driver can also be used
> on DT-based systems.

I'd leave this up to someone who needs this to work on DT. It'd require
bindings, too, and the support wouldn't be testable at this time anyway.

-- 
Regards,

Sakari Ailus

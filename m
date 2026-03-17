Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A429835CB80
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740960; cv=none; b=H/8glKaVNduFb8wZX5djUE9lJ39aKoldSwrUMJV2q3ZcYHrYs6pGNvg6QKelZLA5e27Yk0oV60ohnIHmSTemxnR1JMIp0qgCLu8EglbX9o65PuN6Q4ejNRFt91fTGGvrSYnib4leLwX4pIzdAvwos5LlDaZRlj7H5kHk5oa+cnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740960; c=relaxed/simple;
	bh=lGmQZd6UeipIviC9+XGvdPCv/R7tH1qmJvEfxF16uI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WV1ohGFjOsgb80G8f9d4gfGkM48Juu8eea+a43OuYQ3c6veejkoKFGbO4TsjvAwaxqmiQRNlpXduQxZjWJlZuaGSJRCI015g5SZjSetPre+EI95DIlL/ldeDojwbaSFkc6Go8r/Pj4wMtCVgC8ZLLDOU+lW/BLfNQvT1IsWsvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSiazyUf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSiazyUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773740959; x=1805276959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lGmQZd6UeipIviC9+XGvdPCv/R7tH1qmJvEfxF16uI0=;
  b=WSiazyUfog7KY9GTo65MFRfc6ru1r12/VfdvV5CXrp/cnXfyicbz+ZWV
   yV8BvSVA4k//BZ5Itw1EmtttoFNMfexqLrJkffXjnIsqwMMivaxZXmfFi
   PNNNkiOIciiwrKUfxFMXOurJ8a7bxZit/2vePprirdTo1/bSB6z7QJYco
   8S0CnMIdVDKpXmswqCb7LcPcpd/R5vtfibibLHh7slTMgkeInpX1L9I4b
   m28SEMjdRI+kFsgb75R8aJerJ59/JXq1BZCoJVnndcOWV27wvFMZIKw6W
   051ZoiiPVMEPOQeIuPagHdpaT+y346FItQKxjQ2lbsx1wow1hqo4k8Ewv
   A==;
X-CSE-ConnectionGUID: EI+rsQT4S/u06NnSHZuwrQ==
X-CSE-MsgGUID: EpKEMkc5TMyGhHAMsJVV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74801807"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74801807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:49:18 -0700
X-CSE-ConnectionGUID: CpBeq6/LSKaubM2zkb1XLA==
X-CSE-MsgGUID: 4IlAYHnpRVa2PWCAycujSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222161561"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:49:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D341F11F870;
	Tue, 17 Mar 2026 11:49:14 +0200 (EET)
Date: Tue, 17 Mar 2026 11:49:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 04/11] Support long options and improve
 help text
Message-ID: <abkjmuuQvBG12qBJ@kekkonen.localdomain>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-5-sakari.ailus@linux.intel.com>
 <20260316144151.GF31604@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316144151.GF31604@killaraus.ideasonboard.com>

Moi,

On Mon, Mar 16, 2026 at 04:41:51PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 10, 2026 at 10:46:10AM +0200, Sakari Ailus wrote:
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  raw2rgbpnm.c | 34 +++++++++++++++++++++++++---------
> >  1 file changed, 25 insertions(+), 9 deletions(-)
> > 
> > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > index 14cfa7e7a46c..16ef64e984b9 100644
> > --- a/raw2rgbpnm.c
> > +++ b/raw2rgbpnm.c
> > @@ -24,6 +24,7 @@
> >   */
> >  
> >  #include <ctype.h>
> > +#include <getopt.h>
> >  #include <stdio.h>
> >  #include <stdint.h>
> >  #include <stdlib.h>
> > @@ -836,6 +837,17 @@ static int parse_format(const char *p, int *w, int *h)
> >  	return 0;
> >  }
> >  
> > +static struct option options[] = {
> > +	{ "algo", required_argument, NULL, 'a', },
> > +	{ "brightness", required_argument, NULL, 'b', },
> > +	{ "format", required_argument, NULL, 'f', },
> > +	{ "help", no_argument, NULL, 'h', },
> > +	{ "high-bits", no_argument, NULL, 'g', },
> > +	{ "size", required_argument, NULL, 's', },
> > +	{ "swap-rb", no_argument, NULL, 'w', },
> > +	{ 0 },
> > +};
> > +
> >  int main(int argc, char *argv[])
> >  {
> >  	FILE *f;
> > @@ -849,7 +861,7 @@ int main(int argc, char *argv[])
> >  	int width = -1;
> >  
> >  	for (;;) {
> > -		int c = getopt(argc, argv, "a:b:f:ghs:w");
> > +		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
> >  		if (c==-1) break;
> >  		switch (c) {
> >  		case 'a':
> > @@ -889,14 +901,18 @@ int main(int argc, char *argv[])
> >  			break;
> >  		case 'h':
> >  			printf("%s - Convert headerless raw image to RGB file (PNM)\n"
> > -			       "Usage: %s [-h] [-w] [-s XxY] <inputfile> <outputfile>\n"
> > -			       "-a <algo>     Select algorithm, use \"-a ?\" for a list\n"
> > -			       "-b <bright>   Set brightness (multiplier) to output image (float, default 1.0)\n"
> > -			       "-f <format>   Specify input file format format (-f ? for list, default UYVY)\n"
> > -			       "-g            Use high bits for Bayer RAW 10 data\n"
> > -			       "-h            Show this help\n"
> > -			       "-s <XxY>      Specify image size\n"
> > -			       "-w            Swap R and B channels\n", progname, argv[0]);
> > +			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
> > +			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
> > +			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
> 
> That won't scale nicely, but I don't want to implement an options
> handling framework in C right now :-)
> 
> > +			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
> > +			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
> > +			       "                          (float, default 1.0)\n"
> 
> Do you know if this option is used by anyone ? It seems a bit out of
> place. Not an issue with this patch of course.

I have no idea. But keeping it won't do any harm, will it?

> 
> > +			       "--format, -f <format>     Specify input file format format\n"
> > +			       "                          (-f ? for list, default UYVY)\n"
> > +			       "--help, -h                Show this help\n"
> > +			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
> > +			       "--size, -s <XxY>          Specify image size\n"
> > +			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
> 
> I'd add a line break before progname.

Sounds good.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  			exit(0);
> >  		case 's':
> >  			if (parse_format(optarg, &width, &height) < 0) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus

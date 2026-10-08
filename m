Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01193A48ED
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492932; cv=none; b=FNkpcaxtan2MH6kvuM/oAIg3DTW5+vShHAmB1zChRJLShMsYq96KvFGSyt2Y7Qs6To2aLCWC6ePGJsePLPjezFJseuexbOStxwiVHlzLwmYQ7z2+x34IyFjh7pA8dTtLjOURcueWr3JjMgg+0l9GiWYm4Askj1VTXgGObbcSlyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492932; c=relaxed/simple;
	bh=YFLMphEHTXCcCNfj6kcUtGUW1Cfn8c/pkWS1d60/tyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FO4F3TSAMat44lr5LTwp5zBYxxFRmWyQNVoQwu9tnvXpzBONC9l72Qp/+EYRippupvPsgQAzCMdtxMi/g8UNVp4Aiyl8AcI9jT7CZ3U1/EPHm9USOB5yEaSWeO564eWg81XbIxwZBtl1FCbsndiBckkuSoUpd8Bbk8eNhMd1Qik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiotezYM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiotezYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791492930; x=1823028930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YFLMphEHTXCcCNfj6kcUtGUW1Cfn8c/pkWS1d60/tyE=;
  b=NiotezYMVuoF5eKy88QfsLI513v17h1XfbascXLibvQXuJpzRO1Nc4HH
   JY38FR8M7qUJ4aOQ6dA45KLbafghc0ObcUqspKTbU9quNHvGiGgxto8eh
   a8/n2Bx6x1Wy5fJ2xMIaUZAnKyWwsp7DN7ycLNbBtG571mtJctLvj15T+
   3rNUj7uT6yPzAHTyNeKMeUouYGVE+cXgr94scPSXmf0g+y+KMfRgpUL8g
   yJVadNrY9/ZThMqyk4hLzrQfxtcIfSYMQBKHXooqkGerYR3Kfj2nELwLi
   a1QBJMfJqM+SctPY1oV3SCx/jZZ+LnUBBGAnuyyzADk38jsElIpmY0tAR
   w==;
X-CSE-ConnectionGUID: jUWr95tIQpSk1UyP/4PK8w==
X-CSE-MsgGUID: an1SBHkKSdiQS9ZlaMjFVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="292649"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="292649"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 13:55:29 -0700
X-CSE-ConnectionGUID: wCIozkMxTFWb4wAVxuQAqw==
X-CSE-MsgGUID: B5QJfYCXRUW0zja4FoTBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="97219"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 13:55:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B771121B94;
	Thu, 08 Oct 2026 23:55:28 +0300 (EEST)
Date: Thu, 8 Oct 2026 23:55:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>,
	"dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Message-ID: <asgDQNWy7Vfs8M7x@kekkonen.localdomain>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Wed, Oct 07, 2026 at 03:39:55PM +0000, Tarang Raval wrote:
> > +static const struct cci_reg_sequence mode_2800_1576_30fps[] = {
> > +       { OV05C10_REG8(0x00, 0x20), 0x00 },
> > +       { OV05C10_REG8(0x00, 0x20), 0x0b },
> > +       { OV05C10_REG8(0x00, 0xc1), 0x09 },
> > +       { OV05C10_REG8(0x00, 0x21), 0x06 },
> > +       { OV05C10_REG8(0x00, 0x11), 0x4e },
> > +       { OV05C10_REG8(0x00, 0x12), 0x13 },
> > +       { OV05C10_REG8(0x00, 0x14), 0x96 },
> > +       { OV05C10_REG8(0x00, 0x1b), 0x64 },
> > +       { OV05C10_REG8(0x00, 0x1d), 0x02 },
> > +       { OV05C10_REG8(0x00, 0x1e), 0x40 },
> > +       { OV05C10_REG8(0x00, 0xe7), 0x03 },
> > +       { OV05C10_REG8(0x00, 0xe7), 0x00 },
> 
> Multiple entries for the same register value seem unnecessary.
> You can keep the last entry only.

There seems to be some, but in at least one case this is quite possibly
required: P0:0x20 is software reset, and this being Omnivision sensor, it's
hard to say what it actually does. The hardware reset value of the register
is 0xb, and it seems it won't return to 0xb when written 0 nor streaming
works. So it seems these two writes are needed.

-- 
Regards,

Sakari Ailus

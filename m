Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D547A0A6;
	Fri, 27 Feb 2026 22:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229691; cv=none; b=MBk/nfiAiZYiSoADqUJOtYOv4mr2cPaVYPivR3qUtLUU2IVo5T/x3VnHOPT0EJz/ybpQjIqhsTELc7wCXHQ6aXMT02juRFTqmFZ3MVqhiitMSaLpXMp4udqs4g1gI2jtGBVANiRKUzsYLfGaAs51Io5AeQIHELbSDppFtqZsDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229691; c=relaxed/simple;
	bh=yTJsHtad1fEE/mc1m6qS2A8ubFKwfyXwKnw90FlAGKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/pyBJnbfwHUDphXGpT1/3xcxuJcHG2XBnRoSpvWbZVuHq7TG+QNTjIvk2lEKD6tkSpfVw3ZmHC1XgjWWUo4kD50p7bqmxoZ8HwjwyrtEvnWKAjEA534VMgptuWmnGoZtUZ7LgZX7H8ozrCpxH6iIa/+2upOpUiTySPzWPS0/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgKGFlex; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgKGFlex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772229689; x=1803765689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTJsHtad1fEE/mc1m6qS2A8ubFKwfyXwKnw90FlAGKk=;
  b=fgKGFlexfdrIaGM0FKaazMppeu32DLuSmgdSqQOxyxt2++BXkU0KLnbE
   dS02zMDz/0VDgk4r41oH0qiChfdVSAbhVuRmOK48pRV4TOAejCi9UrysT
   jeMO3XY6F/uHb6cwjxjo+CuV5TumlkXyZddDIbbhvElmiNdqAAGvIFe4X
   6SOrUvXyWQw2JZoM5frbizMIr4EHuhv+CJbRLhhy0pryiTpjij8aKbVx5
   uWzTL8Df+qjDx1+VZS8FVTpcPuCAaFC9h+wSA3na7kNcFubdHSbmumLXp
   mGjROa3x7eE9MyJdXl5vozObUfMQ1h8FGCPsigaGTIFViPVLbdOwxUZSe
   g==;
X-CSE-ConnectionGUID: ppqP1VgaSNetVNIMWOZzmg==
X-CSE-MsgGUID: j3EtoxDWTuyaFEUzouDGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="72350452"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="72350452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 14:01:29 -0800
X-CSE-ConnectionGUID: LfRj7YVVRkWkuRH/pRd4hQ==
X-CSE-MsgGUID: 1dzJYzm+TMqAn1uv7dD17g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216153457"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.205])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 14:01:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32AF311FA45;
	Sat, 28 Feb 2026 00:01:55 +0200 (EET)
Date: Sat, 28 Feb 2026 00:01:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] media: i2c: imx412: power on timing adjust
Message-ID: <aaIUU5MBaCNyaylX@kekkonen.localdomain>
References: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
 <9e52af03-772b-4ec2-8834-7f2007efcf78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e52af03-772b-4ec2-8834-7f2007efcf78@oss.qualcomm.com>

Hi Wenmeng,

On Fri, Feb 27, 2026 at 01:34:25PM +0800, Wenmeng Liu wrote:
> Gentle reminder.

I'll try to review these early next week.

-- 
Sakari Ailus

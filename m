Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EB4CF49E
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177447; cv=none; b=LlQ340ahPsc4hOppJhMzkOvBa87zOD2QIjbNSXcSmDD7ejHGL411fuGo4tR46Pncm5btZxlvhXAU/WGaXcLes7BeQ8QLI+RP9nDOq2Ob/juzY7hhMRYlKhSU1OAj5cSmUEuKBwHh7pb6tr179eMw+e9WjorvIkS/NH+0MeQeQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177447; c=relaxed/simple;
	bh=W6Kr1B7V25s/+ErZIvkn6Y1qhx7RMeoCaI29CL5uHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3UFWKWToJhe5h9Tci274Nxcx/SYVWj+WfQdil6AkHyVoEllIini+71wfM4eIfk8MH15vN4VitgT/PZPtRdQEAmjSL5xyqGRwna/EQUYeAZC3oDMdD2+nNcBcBYhKlnA7A6ojKesALA6iR1eFFFj7uIh4yYeHdnohhgva9O+SbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH1i9+73; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH1i9+73"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so389093eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177445; x=1792782245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqCDWWyE+/CBKZipmpjsIgaXREZgrpMVatuFhbPuqzQ=;
        b=gH1i9+73bB2gCPsSH6ajh8OHM1oRQaRSe9xIlYQNbUGn1W2G3px4JkYv9arKwdihb6
         HQFeuUO/p9+S10v3F0yPk+4s991Ac8pj4t38KAkn1gMwc11xcN1FOQDz3/wXvQZK1Hl1
         e7kdzqZcIxH9JVNkIfkbWzWF67a4q86K2K6Ei5tBTZsIIzvW3SNq70I1Mtcn3jZXim1w
         FU36ZtuciXOqlqOjRoHUgz6uwfSZqSGbh+q26Z1hkq0m/YcvAOzB8ga0kLl3kpb/6OPs
         or5JpLO75ORz4m0RRO4lKl3a39FAbWin1O7jC5EEp9ls8kRPHrXepdRqGxP3FL7j2XH/
         ztCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177445; x=1792782245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqCDWWyE+/CBKZipmpjsIgaXREZgrpMVatuFhbPuqzQ=;
        b=YE+v4OHJOpEmgRChLGcOugeyYGpEK5dDSNsdFa3iUm8u9KPZoQr6KQz+vVtuqjdZTH
         AR5/KgmaedG1BJNUcfGz3mS/Sjf52629InNMKWOqRozegbPcVOn8fTdxGyxeH+UrGj7d
         CNIYrOThrs8Kkc54SfZT/TtqCylJEctXuHNJZBVqiqfRwuos4kwLjoqwfMEMuvEIef+6
         n0NtNdC4WOFd//oEo4ok2iYrN2coYOAGugoy0c5DVcnN9K/93AGo2+F51T1FyCy5JIPx
         2EjWrALXPoPuaDN8y0JBhWmTKJxkX0lPWfammvpWBAir8+cZz1rqODhajA0225GF8YN0
         gkDg==
X-Gm-Message-State: AFq9FYKODrBVpZtzIW+Qu87pjrDolixh31aD1vpKRlaEzkSM69EXc735
	ebkbadW9x66m96mnmkDdM4uqjS+nySIZx3ToGqvssecdk4twGJrV4eF7
X-Gm-Gg: AYBFou26mC5SPGCl5EQUQ9G2uyh4Z05dLXgae6I6WfSGO1R1guU4ZOS5Jqz8Jpp1Ozm
	twoRH/MWCorV4TV79u0cmqPS4YEx6MFRhU/STNTm8DTyyqPbf6xzDGjxTGu2VS1a5omcgD6B2WJ
	S50C/9a7K6+F3GjUEbO/B1w1pirPneQ3PXVPjpwYyQsXVUDDcN/hW2JuBcOHnneR0rnuFbBwANU
	qSV67H3dFKuoRPJNg36NJ20bPhnXGmQes/SRunVhY/W7Pdi0ZDviQyKKRkZRnB2NRLbB/E0UoKr
	RtJQkgOZgjiBteWZzNsIL95qmNiYpi7e1xWUCEgOPe/ACTWB36WJeM0ZoKKnBD0zYbK2WdTGOyq
	hy+7liF9MF/tQN6YNSxZp0UHvXMHmzZ/ZQfsqef841bifijXRM5S4HHSSEqaNvriNxCggSegiG0
	iZA9MQkLdNwWQLAmbrdQMzaTfDGDEkV2V1pAut8sF4QlupKyZi5oMcXTMo05LNYSSI++pfXAzid
	tZQDvAF
X-Received: by 2002:a05:7300:de49:b0:35a:7020:c08a with SMTP id 5a478bee46e88-361a186094cmr795638eec.19.1792177444384;
        Fri, 16 Oct 2026 12:04:04 -0700 (PDT)
Received: from fedora ([2406:b400:66:38ee:e4b5:9757:d5c6:2111])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm7596781c88.17.2026.10.16.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:04:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:33:56 +0530
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: Slawomir Stepien <sst@poczta.fm>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Kees Cook <kees@kernel.org>, syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: dvb-core: fix OOB read in
 dtv_property_process_get()
Message-ID: <atJyM5S5rekF7i95@fedora>
References: <20261009142303.166373-1-seedandsyntax@gmail.com>
 <asyMkMz-T1LvvrFi@nr200>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asyMkMz-T1LvvrFi@nr200>

On Mon, Oct 12, 2026 at 09:30:24AM +0200, Slawomir Stepien wrote:
> Hi
> 
> Tested-by: Slawomir Stepien <sst@poczta.fm>
> Reviewed-by: Slawomir Stepien <sst@poczta.fm>

Hi Slawomir,

Thanks for testing and reviewing my patch!

> Thanks for adding me! I think this patch is better than the v2 generated by syzkaller.

You're welcome, happy to help.

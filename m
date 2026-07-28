Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9D313E31;
	Tue, 28 Jul 2026 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208992; cv=none; b=MUUo0sIy0idkUIcrX/0W1LNZFtiv9S7KMmtQ4ndfVe+ShAMxPDHWL5X8NQ0/yXWD+OmnjhjxZDh3O/RcoWtwWVOaFQ8Tq8q5xavq4RMVOZuLJgPxCyQE+WcDBeERPH7Yi357kdT4Dnkn+KoDRk2/kkt2aZ2ttxDwqVKanMxCEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208992; c=relaxed/simple;
	bh=cMnls2mQOzd6/FgU2e20t8wg4Cq4h/5U0x65lEN4mXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzDVttLpZ4o6ZlBZAwgYyyNuHz04NHjHtn8W2o017CEV9eASQoZTB1e2NB4mWoqPaqrK1abQzY6DD9F5RmxE4aQgLpr9Uc8OuaWkAIFfeQmuhjLRt5B5MXbGMnUmp5y78NQDLDF+w9ENBonJoBqvuwNxu138nBO6h3lqYvP3Xnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m7P8IdWU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m7P8IdWU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cJq5/saQiKHujaU2K/5PaaRxVtX17WJ1TBY7U3Eo0xg=; b=m7P8IdWUJNeInVd0uXQVrCQFX5
	Y6rGZiajoTOUt8bJ7zTlZh1n+or4Y45zsRFQrW0h88HOW/ZWB4HUumLErD5fjqfbiwNGX4eHNygQD
	uyALjDwkCXJQsXFqlscNozR2pmNXhZ6BZmQY2lWlKihdLPYH3hzwXMsZ7mziO/h0xvdLAInE0Wq7X
	LRyBLMs2zMslA7DjzeOpYFyiYkREMqIVMa+mDxGc9RFYBo2ZqcV+D274I6ajIgXiLnj0IuWwn0zLW
	i8nq/oYgD36g1wtdVbh1dfHSu+MXP1WIuAUh1K4kdAVZ/ynb4dhxFKj0SiEZEUdhNfbb1hs2g0xsn
	y/DETNvg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYPK-00000004KAh-3zsp;
	Tue, 28 Jul 2026 03:23:06 +0000
Message-ID: <c571b85e-e202-46fc-b3be-792b3a105fb9@infradead.org>
Date: Mon, 27 Jul 2026 20:23:05 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: fix a few typo and wording issues
To: =?UTF-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>, mchehab@kernel.org
Cc: jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260728030748.45399-1-yuebingkun@kylinos.cn>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260728030748.45399-1-yuebingkun@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/27/26 8:07 PM, 岳秉坤 wrote:
> Hi,
> 
> This patch fixes a few small documentation issues in Documentation/ files.

These changes look good to me. Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> I am a newcomer to the Linux community, and I am eager to contribute
> and learn through small, helpful fixes like this one.
> 
However, there are probably some process issues here.

E.g., the 2 lines above should not be part of the commit message. You can
include them after the "---" line just after your Signed-off-by: line.

> These changes are limited to spelling and wording corrections and do not
> change behavior.
> 
> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
> ---
>  Documentation/ABI/README                                        | 2 +-
>  Documentation/ABI/testing/sysfs-edac-memory-repair              | 2 +-
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

and it's up to various maintainers as to whether the patch will have to be
split up into multiple patches to be applied.

> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index 315fffe1f831f..27c962e6a872c 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README
> @@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
>  
>  
>  Note:
> -   The fields should be use a simple notation, compatible with ReST markup.
> +   The fields should use a simple notation, compatible with ReST markup.
>     Also, the file **should not** have a top-level index, like::
>  
>  	===
> diff --git a/Documentation/ABI/testing/sysfs-edac-memory-repair b/Documentation/ABI/testing/sysfs-edac-memory-repair
> index 0434a3b23ff3e..ab199132ffd8a 100644
> --- a/Documentation/ABI/testing/sysfs-edac-memory-repair
> +++ b/Documentation/ABI/testing/sysfs-edac-memory-repair
> @@ -160,7 +160,7 @@ Description:
>  		in trace events, such as CXL DRAM and CXL general media
>  		error records of CXL memory devices.
>  
> -		When readng back these attributes, it returns the current
> +		When reading back these attributes, it returns the current
>  		value of memory requested to be repaired.
>  
>  		bank_group - The bank group of the memory to repair.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 6f66ca38589e8..164cf0ad35931 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
>  drivers may adjust the requested routing table.
>  
>  The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> -both ioctls. This indicates thare are more routes in the routing table than fits
> +both ioctls. This indicates there are more routes in the routing table than fits
>  the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
>  with the first ``len_routes`` entries of the subdevice routing table. This is
>  not considered to be an error, and the ioctl call succeeds. If the applications

-- 
~Randy

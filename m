Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481F3FCB33;
	Mon, 11 May 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509020; cv=none; b=iKVX4meQgzM38G0aRQSoi4RH6NwWEekKP/mNJKTXhQlSdq+zJTKkwz6kJoYxbt11YuAyjueRRdCQQwYofkm07GMfLNogrWyUSJuZnFEBXbUS0M/BDn56Ey0XCLF+Q3D1Tuhm5PCE7zVSTbsOo7T0CjcYghp3iIC/HKU7l19vOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509020; c=relaxed/simple;
	bh=KGLbhC1AcNsW/xmMSsaNNyBbI9XbguNqIoERizAvMZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW4lG6G8RSUb6pUblBqdtJNcaGYj22woByPHEbhvDEnmK8dLlvRnOZeXqXhg/twdCJ6KReT9Q4ecA3gdbJH3myMf3C7y501dIyFYy3dcEpwdtGmrx/f9zerkIumZWdpNi3HTXAwStZTiGM6/eHWsre6Gc05vesbvtXruAAFW/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3haKMx+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3haKMx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A75C2BCB0;
	Mon, 11 May 2026 14:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509019;
	bh=KGLbhC1AcNsW/xmMSsaNNyBbI9XbguNqIoERizAvMZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E3haKMx+tV2UfFsjS3oO6NJ0ZDimkaDF9DPE0gTw7IZ0nLmCz8rkLyR/uq6MQlZOf
	 hnZjHKt58/qaV+hdRPliMVeRBXoRokkpvM+1+7cQ0ovf8QK058fizZbFwx0aCLBspc
	 S8Yd4vfXodvBIh3L9yGeco1Xh/CtMP2JeMk2P0RdEgUDUOvsOfS/Ax4P354uA6CH3i
	 tnzao2R2hc1LZuMREm3GM3oA3DlEPiJsuQYvSpVB1Z1YwVrgoG+GmdI2lONi/xeEj9
	 jx2ZLVgxWxVMqkJUqovGQGXnd9p/fSIo4mFSX1/kLGm6S7wpEBMazSWX3B2toRgmCB
	 q+ejOyVQs90Dw==
Message-ID: <8134fd03-7085-4572-ab1e-402d772a0921@kernel.org>
Date: Mon, 11 May 2026 16:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: uvcvideo: Avoid partial metadata buffers
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Apr-26 07:19, Ricardo Ribalda wrote:
> The current code can lead to partial metadata buffers when the metadata
> queue transitions from empty to ready. Fix that.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I've merged this in my local uvc/for-next branch.

I'll push this out to gitlab for CI later today.

Regards,

Hans



> ---
> Changes in v2: (Thanks Laurent)
> - Transition to UVC_BUF_STATE_ACTIVE with the data buffer
> - Link to v1: https://lore.kernel.org/r/20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org
> 
> ---
> Ricardo Ribalda (2):
>       media: uvcvideo: Do not open code uvc_queue_get_current_buffer
>       media: uvcvideo: Avoid partial metadata buffers
> 
>  drivers/media/usb/uvc/uvc_video.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> ---
> base-commit: 2e9a8a967f836cf879f35c7434025de265826cc1
> change-id: 20260415-uvc-meta-partial-a5767866d0e0
> 
> Best regards,


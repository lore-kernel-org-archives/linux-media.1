Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112513D953E
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169020; cv=none; b=QX07VdzR0qUpVTmVnuj6HAzm/SBHYE80C4RuwN9+3KdBWOCZ8j6ywAhhgIHnlIRYq6LSN9Iq2grXBgpWZlXuJrtPS8HCJxgszPfQSHlvzLri5OhciTVRyOE7BHVLvmS4LhOhNz/aZEXaIMsAAO/4BbH95WJv/qRCMuQU6b8q9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169020; c=relaxed/simple;
	bh=OCbTK+iZQ7t9O9A/Nos604E0g+dwkmvk1PEanBMiZKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psgqxyIqhej/nW6Ew5C4iu377EmTTKYe9Ep8BV6GV02OSu1U63D3uI88bTlQ9dPfI+wKex3pHu7gXPWuuhnH/1uvEiRsluQj+Ikxgf4wlSQ5PybXZtlXfWozEV+a8NwAVG/gicq3Aw+PRyUdPjBcNxr+weuHjL4QJvAXvQgqOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MVKMCMtZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVKMCMtZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3770363a91.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788169018; x=1788773818; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jxNSJlI7/xJYZETeCx1xokloCJgWDhRl4+gi5TQvFI=;
        b=MVKMCMtZ8a1Hmo90dkXpEMl/Jz71oIuXHxgQ3+rothnT5WDUh2KeU6pFK5btVJr8bG
         gOc9vPMmKXyWihH772sOxZvpw8CYa4bFoBElydQdp9YuSubcVBX1VhH4hzkXkz+6NFRW
         l1KpYSP/YsrEbmtQeiwbUsztZP1K0gX/hAAUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169018; x=1788773818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4jxNSJlI7/xJYZETeCx1xokloCJgWDhRl4+gi5TQvFI=;
        b=Hr4x1xbnhGgn/rnGiiKSQOQa2RNgD6GFhDIcPGhi4PZ3/sCsNt41gd64sMN7J71E8E
         /4TXBX8bUJDygWIsOBZH5zr9qMmZqN9Z07efnaEyq2kIq6x+1zZAOewkenOJ8rn5u6UW
         rLjkigSJafGGFR5UxVBeJVERNLfDFd/ZOSWSRWh5CEgInuEBw+fd+gGJJFe3HnK8Nrd5
         /UsoBE/sVktzGUqkCdRKgSHqvvGnpvn/IRyk3cC96LsBbO0Ww/BTWTquCDXAbK2c1tJr
         X1KuPuGXHnF7k3ReD1RJ3SUB2byncFlAlrKkbSp64tPHcWbFHA49SafmSHRIuZ70GUC3
         Vo4g==
X-Forwarded-Encrypted: i=1; AKwUvBxblQm7vje8sDDP25QMkhoasDQzoejo/FXfptYvdwiCc4SkQWsU39rP0AuBUCQw+6tF2KFbIMOrdWqiqw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4nR/tjoLfKScBMJqI89/unRtR6IIYIsssm8lAwKo6sz18z7D7
	0AbT9DhLUUcF2i3CMttpApGS50Nim9em8Xe5Ou2w0I/9iTtqP37TN+Ua1O+jMdXA8VKCNJCOkhD
	CLEc6I4fF
X-Gm-Gg: AYBFou16UpoEs0MzIz/KPYaT0lw2Di8TOGfmKsZ7HHEIb48TYdN8Z5TOvxuSXzIml/T
	T6WRYS6fb7uSbscuJ2vF/jkdCLxrLJ8iLNbca98CMm1RH5Za4TNnqOUAuOq8a+R06BxQRjOi0mT
	ULtB5NVi2f2SRpQV9+TGXb6H1mM/2yMsRE31XZIoldQKh19sCawdQlxvePBX4yLbMrwsSCmnaY7
	Rigg+YLvWe642OUBG8fODzmuDcdmMFSIWNZ5oLuc2pQY5aR7hfB7ZYrEGPihrmAgDr+PigMvDzq
	H9V+mAIoE5oB+toGwkZQBeiyXy5jouq5qIxhyESmC/ZNIl1vuiwZUwSQQvLTRBvAMYHJXjcoin2
	zJS5+PYl99E6wrt2PUZrFjRyzlG9Zu5ZZVKHVwNkOYOwZqsiIvKMXi6fNNPzU3QHkggxbx1VUb2
	7vDa1WRwScY5bSzcL8wPJDfNNfcfdq4Er9QnosovDNXFSOv6gkb6dtklebeNhBDC5jRBMoBIIIS
	O6eeWXQBlSYzcunZKgTwe0U3Q==
X-Received: by 2002:a17:90b:1810:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-398f82035cfmr2972398a91.4.1788169018329;
        Mon, 31 Aug 2026 02:36:58 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398b18b4074sm12232073a91.12.2026.08.31.02.36.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:36:58 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2418464a91.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:36:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJJ59G7vWxft16rY5CWfZTLia2QOIgpAA/sjv4E7mecj/0ZTIxeYMvbf3earUYQJjZFdvVPhbPSfzLzA==@vger.kernel.org
X-Received: by 2002:a17:90a:e190:b0:398:9be8:ea6c with SMTP id
 98e67ed59e1d1-398f8903eeamr3419790a91.25.1788169016691; Mon, 31 Aug 2026
 02:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-2-jordan.mymail@gmail.com>
In-Reply-To: <20260828152557.653475-2-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:36:41 +0200
X-Gmail-Original-Message-ID: <CANiDSCvrDUYkC3poVeGEEJz=G2iS7yr9Z-XXn=MUL6P0XKN2BA@mail.gmail.com>
X-Gm-Features: AcwNN1XcwakjEWy6PbNDrLprpPw6NBVd4ieA5cr4Yvi4JsrEU1UdN0sl2aRkuuY
Message-ID: <CANiDSCvrDUYkC3poVeGEEJz=G2iS7yr9Z-XXn=MUL6P0XKN2BA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: report AUTO_UPDATE controls as volatile
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael


On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> A control with UVC_CTRL_FLAG_AUTO_UPDATE is one whose value the device
> changes on its own: the driver never trusts its cached value for it,
> re-reading the device on every VIDIOC_G_EXT_CTRLS (the rollback at the
> end of the ioctl runs uvc_ctrl_commit_entity(), which clears ctrl->loaded
> for these controls) and re-reading it after each write. That is exactly
> what V4L2_CTRL_FLAG_VOLATILE describes to userspace, but the driver never
> reported it, so applications had no way to know that the value they read
> can change under them and that a fresh read is worth issuing.
>
> Report V4L2_CTRL_FLAG_VOLATILE for AUTO_UPDATE controls. The uAPI
> documents writes to a volatile control as ignored unless
> V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is also set, and this driver sends every
> write of a writable control to the device, so report EXECUTE_ON_WRITE
> alongside it whenever the control is settable.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83..aceb26310 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
>             (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
>                 v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
> +               v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +               /*
> +                * Writes to a volatile control are documented to be ignored
> +                * unless EXECUTE_ON_WRITE is also reported. The driver sends
> +                * every write of a writable control to the device, so report
> +                * the flag accordingly.
> +                */
> +               if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
> +                       v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       }
>
>         if (mapping->master_id)
>                 __uvc_find_control(ctrl->entity, mapping->master_id,
> --
> 2.43.0
>


-- 
Ricardo Ribalda

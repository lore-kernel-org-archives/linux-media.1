Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89213AD51B;
	Mon, 20 Apr 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691296; cv=none; b=AxXdyijKDlGiuSSO9sMBH70YOxmXGPKdPDICPKgh1RQ6MApIgiPSU0qSebs8Og4XZR9nWVHvZ/LPAPmBNkf+xn4+IEeHzD1QocehZEol0xG2JQTdmNEWpZUpLeYyS0wW9cB6VhWtHNcXOLjBE56pFM9rx2HPg+GArUPj9RyFzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691296; c=relaxed/simple;
	bh=9j1J9ggO3DFAu1UEIccrDMBifYbnJC3uZbxVld7zfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHj7twNhk1O1Y6dTR/CKx/QetF9q2Ik25UDuLnRvhxUBQ5T2BvOPZzVwBl+BED6Knty/9lQKI3/yL9WjFdGVnnVeBjuI3WC+o1S+/Hi34p3WQgeVo/DbzfHCtGqmz7GjXapDSl3bTA1Ev2S7VnHewwUpqltMFTW8FXix7TdUZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNyiBOya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNyiBOya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32E0C19425;
	Mon, 20 Apr 2026 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691296;
	bh=9j1J9ggO3DFAu1UEIccrDMBifYbnJC3uZbxVld7zfx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BNyiBOyaoiSAVFpQidFUWzksqJBT908SZ2i3kzZ4h3aW5nv4pZmYgy9oeu094ohLr
	 aliJZbg3cUuEnUGWKU0BfCxRLNLXKDuaEVir73IJntBuxR0igBB3tLU39lkQxAP8gL
	 kt9i8IPSxAyYNzogYjZ4juq1MAJQZ1eOCFhW4tBCRIXZZvsR73B6rRS0EH9FeKfa2k
	 /UlEzrxteVsZ7Q8aFizuSig+jHy5dFW6laxpcrjL0LAADkNSOfsicVYFuwuFWCMbxp
	 exBOu0tmqyg6Y+vN1EkYJqZ//d+YFW2+dUt/rMeuwKi4PKughxiK76aj5r69xq3oPr
	 owFpFx7XAYpyw==
From: Sasha Levin <sashal@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 5.10.y 0/3] media: uvcvideo: Allow extra entities / Mark invalid entities / heuristic
Date: Mon, 20 Apr 2026 09:21:18 -0400
Message-ID: <20260420-stable-reply-uvcvideo-5-10@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414110113.319219-1-ribalda@chromium.org>
References: <20260414110113.319219-1-ribalda@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 14, 2026, Ricardo Ribalda wrote:
> Backport to 5.10.y:
>   cae79e50d122 media: uvcvideo: Allow extra entities
>   0e2ee70291e6 media: uvcvideo: Mark invalid entities with id
>                UVC_INVALID_ENTITY_ID
>   758dbc756aad media: uvcvideo: Use heuristic to find stream entity

Queued for 5.10, thanks.

--
Thanks,
Sasha
